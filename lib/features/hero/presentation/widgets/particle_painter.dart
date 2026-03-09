import 'dart:math';

import 'package:flutter/material.dart';

import 'particle.dart';

class ParticlePainter extends CustomPainter {
  ParticlePainter({required this.particles, required this.accentColor});

  final List<Particle> particles;
  final Color accentColor;

  static const _connectionDistance = 120.0;

  @override
  void paint(Canvas canvas, Size size) {
    // Draw connection lines
    final linePaint = Paint()..strokeWidth = 0.5;

    for (int i = 0; i < particles.length; i++) {
      for (int j = i + 1; j < particles.length; j++) {
        final dx = particles[i].x - particles[j].x;
        final dy = particles[i].y - particles[j].y;
        final distance = sqrt(dx * dx + dy * dy);

        if (distance < _connectionDistance) {
          final opacity = (1 - distance / _connectionDistance) * 0.15;
          linePaint.color = accentColor.withValues(alpha: opacity);
          canvas.drawLine(
            Offset(particles[i].x, particles[i].y),
            Offset(particles[j].x, particles[j].y),
            linePaint,
          );
        }
      }
    }

    // Draw particles
    for (final p in particles) {
      final paint = Paint()
        ..color = accentColor.withValues(alpha: p.opacity)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(p.x, p.y), p.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant ParticlePainter oldDelegate) => true;
}
