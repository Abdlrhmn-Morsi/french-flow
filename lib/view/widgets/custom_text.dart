import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int maxLines;
  final bool isMaxLines;
  final double textHight;
  final String? fontFamily;
  final TextDirection? textDirection;
  final bool isCenter;
  const CustomText({
    Key? key,
    this.isCenter = false,
    this.textDirection,
    this.fontFamily,
    this.textHight = 1.2,
    this.isMaxLines = false,
    required this.text,
    this.maxLines = 1,
    this.color = Colors.black,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: isCenter ? TextAlign.center : null,
      textDirection: textDirection,
      overflow: isMaxLines ? TextOverflow.ellipsis : null,
      maxLines: isMaxLines ? maxLines : null,
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        height: textHight,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
