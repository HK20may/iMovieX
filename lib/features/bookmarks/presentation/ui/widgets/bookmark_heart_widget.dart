import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshorts_movies/core/constants/app_colors.dart';
import 'package:inshorts_movies/features/bookmarks/data/models/bookmark.dart';
import 'package:inshorts_movies/features/bookmarks/presentation/cubit/bookmarks_cubit.dart';

class BookmarkHeartWidget extends StatefulWidget {
  final Bookmark bookmark;
  const BookmarkHeartWidget({super.key, required this.bookmark});

  @override
  State<BookmarkHeartWidget> createState() => _BookmarkHeartWidgetState();
}

class _BookmarkHeartWidgetState extends State<BookmarkHeartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.5), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.5, end: 0.8), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 1.0), weight: 40),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.1415,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.red,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleBookmark() {
    final cubit = context.read<BookmarksCubit>();
    final isBookmarked = cubit.isBookmarked(widget.bookmark.id);

    if (isBookmarked) {
      cubit.removeBookmark(widget.bookmark.id);
      _controller.reverse();
    } else {
      cubit.addBookmark(widget.bookmark);
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarksCubit, BookmarksState>(
      builder: (context, state) {
        final isBookmarked = context.read<BookmarksCubit>().isBookmarked(
          widget.bookmark.id,
        );

        if (isBookmarked && _controller.status != AnimationStatus.completed) {
          _controller.animateTo(1.0);
        } else if (!isBookmarked &&
            _controller.status != AnimationStatus.dismissed) {
          _controller.animateTo(0.0);
        }

        return GestureDetector(
          onTap: _toggleBookmark,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.black, AppColors.secondaryBlackColor],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 6,
                          spreadRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      isBookmarked ? Icons.favorite : Icons.favorite_border,
                      size: 24,
                      color: _colorAnimation.value,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
