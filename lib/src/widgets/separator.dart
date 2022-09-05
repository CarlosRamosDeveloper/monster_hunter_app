import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Divider(
        height: 2,
        thickness: 2,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
