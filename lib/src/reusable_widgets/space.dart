import 'package:flutter/material.dart';

class HSpace extends StatelessWidget {
  const HSpace(this.space, {Key? key}) : super(key: key);

  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}

class VSpace extends StatelessWidget {
  const VSpace(this.space, {Key? key}) : super(key: key);

  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}
