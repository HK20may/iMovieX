import 'package:flutter/material.dart';
import 'package:inshorts_movies/core/constants/app_assets.dart';

class SearchingWidget extends StatefulWidget {
  final String message;

  const SearchingWidget({super.key, this.message = "Searching"});

  @override
  State<SearchingWidget> createState() => _SearchingWidgetState();
}

class _SearchingWidgetState extends State<SearchingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  int _dotCount = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.05), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.05, end: 1.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Update dots every 500ms
    _controller.addListener(() {
      final progress = _controller.value;
      final newDotCount = ((progress * 6) % 4).floor();
      if (newDotCount != _dotCount) {
        setState(() => _dotCount = newDotCount);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        final availableHeight = constraints.maxHeight - keyboardHeight;

        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: SizedBox(
              height: availableHeight,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.searchingIcon, height: 100),
                    const SizedBox(height: 24),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: child,
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: widget.message,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              children: List.generate(3, (index) {
                                final dotScale =
                                    index < _dotCount
                                        ? 1.0
                                        : 0.7 +
                                            0.3 *
                                                Curves.easeOut.transform(
                                                  _controller.value,
                                                );

                                return WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Transform.scale(
                                    scale: dotScale,
                                    child: Text(
                                      '.',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black87,
                                        fontWeight:
                                            index < _dotCount
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
