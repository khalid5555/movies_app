import 'package:flutter/material.dart';

class DotIndicator extends BoxPainter {
  const DotIndicator();
  final radius = 8.0;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final dx = configuration.size!.width / 2;
    final dy = configuration.size!.height + radius / 2;
    final c = offset + Offset(dx, dy);
    final paint = Paint()..color = Colors.blue;
    canvas.drawCircle(c, radius, paint);
  }
}

class DotIndicatorCircle extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return const DotIndicator();
  }
}
