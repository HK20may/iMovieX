import 'dart:math';

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  const CustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) => ClipPath(
        clipper: const _CustomContainerClipper(),
        child: child,
      );
}

class _CustomContainerClipper extends CustomClipper<Path> {
  const _CustomContainerClipper();

  final double inset = 70;
  final double radius = 24;

  @override
  Path getClip(Size size) {
    final h = size.height;
    final w = size.width;
    final double c = min(max(inset, radius * 3), 100);
    final dia = radius * 2;

    final path = Path()
      ..moveTo(0, c)
      ..lineTo(0, h - radius)
      ..relativeArcToPoint(
        Offset(radius, radius),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(w - c, h)
      ..relativeArcToPoint(
        Offset(radius, -radius),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(w - c + radius, h - c + dia)
      ..relativeArcToPoint(
        Offset(radius, -radius),
        radius: Radius.circular(radius),
        clockwise: true,
      )
      ..lineTo(w - radius, h - c + radius)
      ..relativeArcToPoint(
        Offset(radius, -radius),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(w, radius)
      ..relativeArcToPoint(
        Offset(-radius, -radius),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(w / 2, 0)
      ..relativeArcToPoint(
        Offset(-radius, radius),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(w / 2 - radius, c - dia)
      ..relativeArcToPoint(
        Offset(-radius, radius),
        radius: Radius.circular(radius),
        clockwise: true,
      )
      ..lineTo(radius, c - radius)
      ..relativeArcToPoint(
        Offset(-radius, radius),
        radius: Radius.circular(radius),
        clockwise: false,
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    if (oldClipper != this) return true;
    if (oldClipper is! _CustomContainerClipper) return true;
    if (oldClipper.inset != inset) return true;
    if (oldClipper.radius != radius) return true;
    return false;
  }
}
