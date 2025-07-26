import 'package:flutter/cupertino.dart';
import 'package:inshorts_movies/core/constants/app_colors.dart';

class LoaderIndicator extends StatelessWidget {
  final Widget leadingWidget;
  final String textMessage;
  final Color? backgroundColor;
  final Color? textColor;

  const LoaderIndicator({
    super.key,
    required this.leadingWidget,
    required this.textMessage,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(56)),
      child: ColoredBox(
        color: backgroundColor ?? AppColors.blue[800]!,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              leadingWidget,
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  textMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor ?? AppColors.blue[100],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
