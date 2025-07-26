import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:inshorts_movies/core/constants/app_assets.dart';

class NoResultFound extends StatelessWidget {
  const NoResultFound({super.key});

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppAssets.noResultFound, height: 160),
                    const Gap(20),
                    const Text(
                      "No Results Found",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(8),
                    const Text(
                      "Try searching for something else",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Add space for keyboard
                    if (keyboardHeight > 0) Gap(keyboardHeight + 20),
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
