import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailsShimmerLayout extends StatelessWidget {
  const MovieDetailsShimmerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Backdrop with play button shimmer
          shimmerBox(height: 300, width: double.infinity),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and favorite icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shimmerBox(height: 24, width: 200),
                    shimmerCircle(radius: 20),
                  ],
                ),
                const Gap(12),

                // Rating shimmer
                shimmerBox(height: 16, width: 100),
                const Gap(32),

                // Genre chip shimmer
                Row(
                  children: List.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: shimmerBox(
                        height: 28,
                        width: 70,
                        borderRadius: 20,
                      ),
                    ),
                  ),
                ),
                const Gap(32),

                // Length / Language / Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (_) => shimmerColumnInfo()),
                ),
                const Gap(40),

                // Description
                shimmerBox(height: 20, width: 120),
                const Gap(12),
                shimmerBox(height: 16, width: double.infinity),
                const Gap(8),
                shimmerBox(height: 16, width: double.infinity),
                const Gap(8),
                shimmerBox(height: 16, width: double.infinity),
                const Gap(8), shimmerBox(height: 16, width: double.infinity),
                const Gap(8),
                shimmerBox(height: 16, width: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget shimmerBox({
    required double height,
    required double width,
    double borderRadius = 8,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  Widget shimmerCircle({required double radius}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: radius * 2,
        width: radius * 2,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget shimmerColumnInfo() {
    return Column(
      children: [
        shimmerBox(height: 14, width: 50),
        const Gap(6),
        shimmerBox(height: 16, width: 60),
      ],
    );
  }
}
