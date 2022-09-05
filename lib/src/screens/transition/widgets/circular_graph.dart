import 'package:flutter/material.dart';

import 'radial_progress.dart';

class CircularGraph extends StatefulWidget {
  const CircularGraph({Key? key}) : super(key: key);

  @override
  State<CircularGraph> createState() => _CircularGraphState();
}

class _CircularGraphState extends State<CircularGraph>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController aController;

  @override
  void initState() {
    super.initState();

    aController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    animation = IntTween(begin: 0, end: 100).animate(aController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
        }
      });

    aController.forward();
  }

  @override
  void dispose() {
    aController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String textPercentaje = animation.value.toString();
    double doublePercentaje = double.parse(textPercentaje);

    return Center(
      child: _CustomRadialProgress(
        porcentaje: doublePercentaje,
        fillWidth: 17,
        innerWidth: 20,
        widgetSize: 350,
      ),
    );
  }
}

class _CustomRadialProgress extends StatelessWidget {
  const _CustomRadialProgress(
      {Key? key,
      required this.porcentaje,
      this.fillWidth = 15,
      this.innerWidth = 5,
      this.widgetSize = 150})
      : super(key: key);

  final double porcentaje;
  final double fillWidth;
  final double innerWidth;
  final double widgetSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetSize,
      height: widgetSize,
      child: RadialProgress(
        porcentaje: porcentaje,
        widgetColor: Theme.of(context).colorScheme.secondary,
        innerCircleColor: Theme.of(context).colorScheme.onSecondary,
        fillWidth: fillWidth,
        innerWidth: innerWidth,
        widgetSize: widgetSize,
      ),
    );
  }
}
