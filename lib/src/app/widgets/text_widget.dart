import 'package:flutter/material.dart';

class BaseTextWidget extends StatelessWidget {
  const BaseTextWidget({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.textScaleFactor = 1.0,
    this.textStyle,
    this.color,
    this.fontWeight,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  final String text;
  final TextAlign textAlign;
  final double textScaleFactor;
  final TextStyle? textStyle;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      style: textStyle?.copyWith(
            color: color,
            fontWeight: fontWeight,
          ) ??
          Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: color,
                fontWeight: fontWeight,
              ),
    );
  }
}
