import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const OnboardingContent({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(MediaQuery.sizeOf(context).height * 0.5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(14),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white.withOpacity(0.85),
            ),
          ),
          const Gap(80),
        ],
      ),
    );
  }
}
