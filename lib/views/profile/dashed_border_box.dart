import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';

class DashedBorderBox extends StatelessWidget {
  final Widget child;

  const DashedBorderBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: child,
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Constants.mainColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final dashWidth = 4.0;
    final dashSpace = 1.5;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final path = Path()..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(30)));

    final dashedPath = _createDashedPath(path, dashWidth, dashSpace);
    canvas.drawPath(dashedPath, paint);
  }

  Path _createDashedPath(Path source, double dashWidth, double dashSpace) {
    final metrics = source.computeMetrics();
    final path = Path();
    for (final metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        path.addPath(
          metric.extractPath(distance, next),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
