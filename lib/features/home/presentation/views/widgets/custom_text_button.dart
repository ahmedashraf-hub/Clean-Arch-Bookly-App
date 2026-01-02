import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.backColor,
    required this.titleColor,
    required this.borderRadius,
    required this.title,
    this.fontSize,
  });

  final Color backColor, titleColor;
  final BorderRadius borderRadius;
  final String title;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: backColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          child: Text(
            title,
            style: AppStyles.textStyle18.copyWith(
              color: titleColor,
              fontWeight: FontWeight.w900,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
