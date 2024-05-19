import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? buttonBackgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? topLeftBorderRadius;
  final double? topRightBorderRadius;
  final double? bottomLeftBorderRadius;
  final double? bottomRightBorderRadius;
  final String buttonText;
  final TextStyle? textStyle;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonBackgroundColor,
    this.buttonWidth,
    this.buttonHeight,
    required this.buttonText,
    this.textStyle,
    this.topLeftBorderRadius,
    this.topRightBorderRadius,
    this.bottomLeftBorderRadius,
    this.bottomRightBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 14,
          vertical: verticalPadding ?? 12,
        ),
        backgroundColor: buttonBackgroundColor ?? Colors.transparent,
        elevation: 0,
        minimumSize: Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftBorderRadius ?? 0),
            topRight: Radius.circular(topRightBorderRadius ?? 0),
            bottomLeft: Radius.circular(bottomLeftBorderRadius ?? 0),
            bottomRight: Radius.circular(bottomRightBorderRadius ?? 0),
          ),
        ),
        shadowColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        surfaceTintColor: Colors.transparent,
      ),
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
