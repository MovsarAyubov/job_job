import 'package:flutter/material.dart';
import 'package:poisk_raboty/core/widgets/size_config.dart';

class RobotoText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double fontSize;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  const RobotoText(
    this.text, {
    super.key,
    this.textAlign,
    this.fontWeight,
    this.fontSize = 14,
    this.color = Colors.black,
    this.maxLines,
    this.overflow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: SizeConfig(context, fontSize)(),
          fontWeight: fontWeight,
          color: color,
          fontFamily: "Roboto"),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
