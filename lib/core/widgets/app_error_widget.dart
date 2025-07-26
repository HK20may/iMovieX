import 'package:flutter/material.dart';
import 'package:inshorts_movies/core/constants/app_assets.dart';
import 'package:lottie/lottie.dart';

class AppErrorWidget extends StatefulWidget {
  final VoidCallback? onTap;
  const AppErrorWidget({super.key, required this.onTap});

  @override
  State<AppErrorWidget> createState() => _AppErrorWidgetState();
}

class _AppErrorWidgetState extends State<AppErrorWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationControllerGif;

  @override
  void initState() {
    _animationControllerGif = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final viewInsets = MediaQuery.of(context).viewInsets;
          final bottomPadding =
              viewInsets.bottom > 0 ? viewInsets.bottom + 20 : 20.0;
          final maxHeight = constraints.maxHeight;
          final maxWidth = constraints.maxWidth;

          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              constraints: BoxConstraints(
                minHeight: maxHeight > 0 ? maxHeight : 0,
              ),
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Flexible animation container
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: maxHeight * 0.7,
                      maxWidth: maxWidth,
                    ),
                    child: loadLottie(),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(2),
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.red.shade500,
                      ),
                    ),
                    onPressed: widget.onTap,
                    child: const Text(
                      "Try Again",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget loadLottie() {
    return Lottie.asset(
      AppAssets.appError,
      controller: _animationControllerGif,
      fit: BoxFit.contain,
      animate: true,
      repeat: false,
      onLoaded: (composition) {
        _animationControllerGif
          ..duration = composition.duration
          ..repeat();
      },
    );
  }

  @override
  void dispose() {
    _animationControllerGif.dispose();
    super.dispose();
  }
}
