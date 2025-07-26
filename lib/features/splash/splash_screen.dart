import 'package:flutter/material.dart';
import 'package:inshorts_movies/core/constants/app_assets.dart';
import 'package:inshorts_movies/core/routes/app_router.dart';
import 'package:inshorts_movies/core/routes/routes_path.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _lottieController;
  late AnimationController _iconController;
  bool _showIcon = false;

  @override
  void initState() {
    super.initState();
    _lottieController = AnimationController(vsync: this);
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _lottieController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  void _onLottieFinished() async {
    setState(() => _showIcon = true);
    _iconController.forward();
    await Future.delayed(const Duration(milliseconds: 1000));
    router.go(RoutesPath.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 142, 111, 145), Colors.white],
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 1. Lottie splash animation
              if (!_showIcon)
                Lottie.asset(
                  AppAssets.splashLottie,
                  controller: _lottieController,
                  width: 400,
                  height: 400,
                  fit: BoxFit.contain,
                  onLoaded: (composition) {
                    _lottieController
                      ..duration = composition.duration
                      ..forward();
                    _lottieController.addStatusListener((status) {
                      if (status == AnimationStatus.completed) {
                        _onLottieFinished();
                      }
                    });
                  },
                ),
              // 2. App Icon reveal (fade+scale with optional glow)
              if (_showIcon)
                AnimatedBuilder(
                  animation: _iconController,
                  builder: (context, child) {
                    final progress = Curves.easeOut.transform(
                      _iconController.value,
                    );
                    return Opacity(
                      opacity: progress,
                      child: Transform.scale(
                        scale: 0.8 + 0.2 * progress,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.23),
                                blurRadius: 48 * progress,
                                spreadRadius: 2 * progress,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            AppAssets.appIcon,
                            width: 200,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
