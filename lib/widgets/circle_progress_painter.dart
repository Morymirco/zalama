import 'dart:math';
import 'package:flutter/material.dart';

class CircleProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  static const double gap = 0.05; // Espace entre les segments (en radians)

  CircleProgressPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final totalSections = 4; // Nombre total de sections
    final sectionAngle = (2 * pi - (gap * totalSections)) / totalSections;
    final completedSections = (progress * totalSections).floor();
    final partialSection = (progress * totalSections) % 1;

    // Dessiner les sections complètes et partielles
    for (var i = 0; i < totalSections; i++) {
      final startAngle = -pi / 2 + (sectionAngle + gap) * i;
      var sweepAngle = 0.0;

      if (i < completedSections) {
        // Section complète
        sweepAngle = sectionAngle;
        paint.color = color;
      } else if (i == completedSections) {
        // Section partielle
        sweepAngle = sectionAngle * partialSection;
        paint.color = color;
      } else {
        // Section non remplie
        sweepAngle = sectionAngle;
        paint.color = Colors.grey.shade200;
      }

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
} 