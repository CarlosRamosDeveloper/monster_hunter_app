import 'package:flutter/material.dart';

class BottomRectangle extends StatelessWidget {
  const BottomRectangle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          // color: Theme.of(context).primaryColor
          color: Theme.of(context).primaryColor),
    );
  }
}
