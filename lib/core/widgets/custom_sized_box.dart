import 'package:flutter/material.dart';

import 'size_config.dart';

class CustomSizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;
  const CustomSizedBox({
    Key? key,
    this.height = 0,
    this.width = 0,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig(context, width)(),
      height: SizeConfig(context, height)(),
      child: child,
    );
  }
}
