import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final bool isBold;
  final Color? color;
  final bool justifyText;
  final bool isCenter;
  final bool underline;
  final bool lineThrough;
  final bool ellipsis;
  final bool? softWrap;
  final int? maxLines;
  final Function()? onTap;
  final EdgeInsets? padding;

  const AppText(
    this.text, {
    Key? key,
    this.size = 18,
    this.isBold = false,
    this.color = Colors.black,
    this.justifyText = false,
    this.isCenter = false,
    this.onTap,
    this.softWrap,
    this.underline = false,
    this.ellipsis = false,
    this.maxLines,
    this.lineThrough = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(
          text,
          maxLines: maxLines,
          softWrap: softWrap,
          textAlign: justifyText
              ? TextAlign.justify
              : isCenter
                  ? TextAlign.center
                  : null,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            overflow: ellipsis ? TextOverflow.ellipsis : null,
            color: color,
            fontSize: size,
            decoration: underline
                ? TextDecoration.underline
                : lineThrough
                    ? TextDecoration.lineThrough
                    : null,
          ),
        ),
      ),
    );
  }
}

class AppBarText extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const AppBarText({Key? key, required this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppText(
        text,
        color: Colors.white,
        size: 12,
        isCenter: true,
      ),
    );
  }
}

class AppTextWithInfoIcon extends StatelessWidget {
  final String text;
  final double size;
  final bool isBold;
  final Color color;
  final Widget infoIcon;

  const AppTextWithInfoIcon(
    this.text, {
    Key? key,
    this.size = 18,
    this.isBold = false,
    required this.color,
    required this.infoIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: text,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
              fontSize: size,
            ),
          ),
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: infoIcon,
            ),
          ),
        ],
      ),
    );
  }
}

class RequiredText extends StatelessWidget {
  final String labelText;
  final String requiredSign;
  final double labelTextScale;
  final int labelMaxLines;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final Color labelColor;

//  final FontWeight fontWeight;
  final double fontSize;

  const RequiredText(
    this.labelText, {
    Key? key,
    this.requiredSign = ' *',
    this.labelColor = Colors.black54,
    // this.fontWeight,
    required this.fontSize,
    this.labelMaxLines = 1,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.labelTextScale = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: RichText(
        text: TextSpan(
            text: labelText,
            style: TextStyle(
              color: labelColor,
              fontSize: fontSize,
            ),
            children: [
              TextSpan(
                  text: requiredSign,
                  style: TextStyle(
                      color: Colors.red,
                      //  fontWeight: fontWeight,
                      fontSize: fontSize))
            ]),
        textScaleFactor: labelTextScale,
        maxLines: labelMaxLines,
        overflow: overflow,
        textAlign: textAlign,
      ),
    );
  }
}
