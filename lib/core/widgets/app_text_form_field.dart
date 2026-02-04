import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/colors/app_colors.dart';
import '../utils/styles/text_style.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.validator,
    required this.hintText,
    super.key,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.autoValidateMode,
    this.onChanged,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.hintStyle,
    this.isObscureText,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
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
  Widget build(BuildContext context) => TextFormField(
    onTapOutside: (event) => FocusScope.of(context).unfocus(),
    controller: controller,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    validator: validator,
    autovalidateMode: autoValidateMode,
    onChanged: onChanged,
    decoration: InputDecoration(
      isDense: true,
      contentPadding:
          contentPadding ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      enabledBorder:
          enabledBorder ??
          OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.gray, width: 1.3),
            borderRadius: BorderRadius.circular(16),
          ),
      focusedBorder:
          focusedBorder ??
          OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.blue, width: 1.3),
            borderRadius: BorderRadius.circular(16),
          ),
      errorBorder:
          errorBorder ??
          OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
            borderRadius: BorderRadius.circular(16),
          ),
      focusedErrorBorder:
          focusedErrorBorder ??
          OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
            borderRadius: BorderRadius.circular(16),
          ),
      hintStyle: Styles.textStyle14,
      hintText: hintText,
      suffixIcon: suffixIcon,
    ),
    style: Styles.textStyle14,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<TextEditingController?>('controller', controller),
      )
      ..add(DiagnosticsProperty<TextInputType?>('keyboardType', keyboardType))
      ..add(EnumProperty<TextInputAction?>('textInputAction', textInputAction))
      ..add(
        EnumProperty<AutovalidateMode?>('autoValidateMode', autoValidateMode),
      )
      ..add(
        ObjectFlagProperty<void Function(String)?>.has('onChanged', onChanged),
      )
      ..add(
        DiagnosticsProperty<EdgeInsetsGeometry?>(
          'contentPadding',
          contentPadding,
        ),
      )
      ..add(DiagnosticsProperty<InputBorder?>('enabledBorder', enabledBorder))
      ..add(DiagnosticsProperty<InputBorder?>('focusedBorder', focusedBorder))
      ..add(DiagnosticsProperty<InputBorder?>('errorBorder', errorBorder))
      ..add(
        DiagnosticsProperty<InputBorder?>(
          'focusedErrorBorder',
          focusedErrorBorder,
        ),
      )
      ..add(DiagnosticsProperty<TextStyle?>('hintStyle', hintStyle))
      ..add(StringProperty('hintText', hintText))
      ..add(DiagnosticsProperty<bool?>('isObscureText', isObscureText))
      ..add(
        ObjectFlagProperty<String? Function(String?)?>.has(
          'validator',
          validator,
        ),
      );
  }
}
