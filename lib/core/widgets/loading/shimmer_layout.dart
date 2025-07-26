import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:inshorts_movies/core/widgets/custom_container.dart';

class ShimmerLayout extends StatelessWidget {
  const ShimmerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double containerHeight = 15;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(kToolbarHeight - 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: containerHeight,
                      width: (screenWidth) * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const Gap(8),
                    Container(
                      height: 12,
                      width: (screenWidth) * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Gap(20),
            Container(
              height: containerHeight,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const Gap(18),
            CustomContainer(
              child: Container(
                height: 320,
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              ),
            ),
            const Gap(20),
            Container(
              height: containerHeight,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const Gap(18),
            Container(
              height: 300,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
