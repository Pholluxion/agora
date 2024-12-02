import 'package:flutter/material.dart';

import 'package:agora/core/core.dart';

class AgoraText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final String fontFamily;

  const AgoraText({
    super.key,
    required this.text,
    this.fontSize = 60,
    this.textAlign = TextAlign.center,
    this.fontFamily = FontFamily.montserrat,
    this.fontWeight = FontWeight.w200,
  });

  @override
  Widget build(BuildContext context) {
    // return Text(
    //   text,
    //   textAlign: textAlign,
    //   style: TextStyle(
    //     color: AppTheme.textColor,
    //     fontSize: fontSize,
    //     fontWeight: fontWeight,
    //     fontFamily: fontFamily,
    //   ),
    // );

    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          overflow: TextOverflow.clip,
          color: AppTheme.textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
