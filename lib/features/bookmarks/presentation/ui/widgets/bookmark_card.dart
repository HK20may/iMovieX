import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';
import 'package:inshorts_movies/core/constants/app_assets.dart';
import 'package:inshorts_movies/core/constants/app_colors.dart';
import 'package:inshorts_movies/core/constants/string_constants.dart';
import 'package:inshorts_movies/core/routes/app_router.dart';
import 'package:inshorts_movies/core/routes/routes_path.dart';
import 'package:inshorts_movies/features/bookmarks/data/models/bookmark.dart';

class BookmarkCard extends StatefulWidget {
  final Bookmark bookmark;

  const BookmarkCard({required this.bookmark, super.key});

  @override
  State<BookmarkCard> createState() => _BookmarkCardState();
}

class _BookmarkCardState extends State<BookmarkCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.05), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.05, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.reset();
        _controller.forward();
        router.push(RoutesPath.details, extra: widget.bookmark.id);
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: SlideTransition(position: _slideAnimation, child: child),
          );
        },
        child: _buildFilmReelCard(context),
      ),
    );
  }

  Widget _buildFilmReelCard(BuildContext context) {
    return Stack(
      children: [
        // Film reel background with realistic perforations
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.7), Colors.black12],
              begin: Alignment.bottomCenter,
              end: Alignment.topLeft,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 12,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CustomPaint(
              painter: FilmPerforationPainter(),
              child: Container(
                padding: const EdgeInsets.only(top: 24, bottom: 24),
                child: Row(
                  children: [
                    const Gap(12),
                    // Poster with film border
                    _buildFilmFramePoster(context),
                    const Gap(16),
                    // Text Info
                    Expanded(child: _buildMovieInfo(context)),
                    const Gap(12),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilmFramePoster(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: CachedNetworkImage(
          imageUrl:
              "${StringConstants.imageBaseUrl}${widget.bookmark.posterPath}",
          width: 90,
          height: 130,
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black26,
                    AppColors.secondaryBlackColor.withOpacity(0.1),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            );
          },
          errorWidget:
              (context, url, error) =>
                  Image.asset(AppAssets.placeHolder, height: 150),
        ),
      ),
    );
  }

  Widget _buildMovieInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.bookmark.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const Gap(4),
            Text(
              '${widget.bookmark.rating.toStringAsFixed(1)} IMDb',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Gap(8),
        Text(
          widget.bookmark.releaseDate,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }
}

class FilmPerforationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill;

    const holeSize = 10.0;
    const holeSpacing = 15.0;
    const margin = 5.0;

    // Draw top perforations
    for (double x = margin; x < size.width - margin; x += holeSpacing) {
      canvas.drawRect(Rect.fromLTWH(x, margin, holeSize, holeSize), paint);
    }

    // Draw bottom perforations
    for (double x = margin; x < size.width - margin; x += holeSpacing) {
      canvas.drawRect(
        Rect.fromLTWH(x, size.height - margin - holeSize, holeSize, holeSize),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
