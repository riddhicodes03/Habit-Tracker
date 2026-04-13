import 'package:flutter/material.dart';

class WaterRing extends StatelessWidget {
  final int current; // ml drunk
  final int goal; // ml goal

  const WaterRing({required this.current, required this.goal, super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final percent = (current / goal).clamp(0.0, 1.0);

    return SizedBox(
      width: 180,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(180, 180),
            painter: _RingPainter(
              percent: percent,
              trackColor: scheme.surfaceContainerHigh,
              ringColor: scheme.primary,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$current',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: scheme.primary,
                ),
              ),
              Text(
                'of ${goal}ml',
                style: TextStyle(fontSize: 12, color: scheme.onSurface),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double percent;
  final Color trackColor;
  final Color ringColor;
  final pi = 3.14;
  _RingPainter({
    required this.percent,
    required this.trackColor,
    required this.ringColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 12;
    const strokeWidth = 14.0;
    const startAngle = -3.14 / 2; // start from top

    // Track (background ring)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * pi,
      false,
      Paint()
        ..color = trackColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke,
    );

    // Progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      2 * pi * percent,
      false,
      Paint()
        ..color = ringColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round, // rounded tip
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.percent != percent;
}
