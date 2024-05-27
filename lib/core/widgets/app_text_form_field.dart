import 'package:flutter/material.dart';

import '../utils/colors/app_colors.dart';
import '../utils/styles/text_style.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    required this.validate,
    this.autoValidateMode,
    this.onChanged,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator? validate;
  final AutovalidateMode? autoValidateMode;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validate,
      autovalidateMode: autoValidateMode,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.gray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.blue,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        hintStyle: Styles.textStyle14,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      style: Styles.textStyle14,
    );
  }
}
