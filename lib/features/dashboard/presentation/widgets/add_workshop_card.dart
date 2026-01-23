import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AddWorkshopCard extends StatelessWidget {
  final VoidCallback onTap;

  const AddWorkshopCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A), // surface-dark
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: CustomPaint(
          painter: _DashedBorderPainter(
            color: Colors.grey[700]!,
            strokeWidth: 4,
            dashPattern: [10, 10],
            radius: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2C), // zinc-800
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[600]!, width: 1),
                ),
                child: Center(
                  child: Icon(Icons.add, color: Colors.grey[400], size: 48),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Add Workshop',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Register a new location',
                style: TextStyle(
                  color: Colors.grey[600], // zinc-500
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final List<double> dashPattern;
  final double radius;

  _DashedBorderPainter({
    required this.color,
    this.strokeWidth = 2,
    this.dashPattern = const [5, 5],
    this.radius = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    var path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );

    var dashPath = Path();
    var distance = 0.0;
    for (ui.PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashPattern[0]),
          Offset.zero,
        );
        distance += dashPattern[0] + dashPattern[1];
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(_DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashPattern != dashPattern ||
        oldDelegate.radius != radius;
  }
}
