import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppTextSpan extends StatelessWidget {
  final String? text1, text2, text3, text4, text5;
  final Function? opTap, onTap2;
  final TextStyle? textStyle1, textStyle2, textStyle3, textStyle4, textStyle5;

  const AppTextSpan({
    Key? key,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.text5,
    this.textStyle1,
    this.textStyle2,
    this.textStyle3,
    this.textStyle4,
    this.textStyle5,
    this.onTap2,
    this.opTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: textStyle1,
        children: <TextSpan>[
          TextSpan(
              text: text2,
              style: textStyle2,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (opTap != null) opTap!();
                }),
          TextSpan(
            text: text3,
            style: textStyle3,
          ),
          TextSpan(
              text: text4,
              style: textStyle4,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (onTap2 != null) onTap2!();
                }),
          TextSpan(
            text: text5,
            style: textStyle5,
          )
        ],
      ),
    );
  }
}
