import 'package:flutter/material.dart';
import 'package:goers_assessment/core/base_widgets/buttons/button_text_alignment.dart';

import 'package:goers_assessment/core/base_widgets/text/text_attribute.dart';
import 'package:goers_assessment/core/ext/ctx_ext.dart';
import 'package:goers_assessment/core/theme/color_theme.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color? colorText;
  final Color? colorFill;
  final VoidCallback onPressed;
  final double? fontSize;
  final double? width;
  final Color? borderColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final TextAttribute? textAtt;
  final ButtonTextAlignment buttonTextAlignment;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonTextAlignment = ButtonTextAlignment.center,
    this.fontSize,
    this.colorFill,
    this.colorText,
    this.width,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.textAtt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textAttribute = textAtt != null
        ? textAtt!
        : TextAttribute(
            style: context.textTheme.button
                ?.copyWith(color: ColorTheme.onPrimary));
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        side: BorderSide.none,
        primary: colorFill ?? ColorTheme.primary,
        onPrimary: colorText ?? ColorTheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12.0),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: buttonTextAlignment.mainAxisAlignment,
          children: [textAttribute.createText(text)],
        ),
      ),
    );
  }
}
