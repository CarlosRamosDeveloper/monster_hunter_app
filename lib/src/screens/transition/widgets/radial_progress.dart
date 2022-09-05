import 'package:flutter/material.dart';
import 'dart:math' as math;

class RadialProgress extends StatefulWidget {
  const RadialProgress(
      {Key? key,
      required this.porcentaje,
      required this.widgetColor,
      required this.innerCircleColor,
      required this.fillWidth,
      required this.innerWidth,
      required this.widgetSize})
      : super(key: key);

  final double porcentaje;
  final Color widgetColor;
  final Color innerCircleColor;
  final double fillWidth;
  final double innerWidth;
  final double widgetSize;

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController aController;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    aController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    super.initState();
  }

  @override
  void dispose() {
    aController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    aController.forward(from: 0);

    final diferenciaAAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: aController,
        builder: (BuildContext context, Widget? child) {
          return Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: _RadialProgress(
                    percentage: (widget.porcentaje - diferenciaAAnimar) +
                        diferenciaAAnimar * aController.value,
                    widgetColor: widget.widgetColor,
                    innerCircleColor: widget.innerCircleColor,
                    fillWidth: widget.fillWidth,
                    innerWidth: widget.innerWidth),
                child: Center(
                  child: Container(
                    height: widget.widgetSize * 0.65,
                    width: widget.widgetSize * 0.65,
                    decoration: BoxDecoration(
                        color: widget.widgetColor,
                        borderRadius: BorderRadius.circular(360)),
                    child: Center(
                      child: Text(
                        '${widget.porcentaje.toStringAsFixed(0)}%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: widget.widgetSize * 0.15,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}

class _RadialProgress extends CustomPainter {
  _RadialProgress(
      {required this.fillWidth,
      required this.innerWidth,
      required this.innerCircleColor,
      required this.widgetColor,
      required this.percentage});
  final double percentage;
  final Color widgetColor;
  final Color innerCircleColor;
  final double fillWidth;
  final double innerWidth;

  @override
  void paint(Canvas canvas, Size size) {
    double radialRadius = size.width * 0.5;

    final paint = Paint()
      ..strokeWidth = innerWidth
      ..color = innerCircleColor
      ..style = PaintingStyle.stroke;

    final Offset possition = Offset(size.height * 0.5, size.width * 0.5);

    canvas.drawCircle(possition, radialRadius, paint);

    final paintArc = Paint()
      ..strokeWidth = fillWidth
      ..color = widgetColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * math.pi * (percentage / 100);

    canvas.drawArc(Rect.fromCircle(center: possition, radius: radialRadius),
        -math.pi / 2, arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
