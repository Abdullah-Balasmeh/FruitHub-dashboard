import 'package:flutter/material.dart';
import 'package:fruti_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruti_hub_dashboard/core/utils/app_text_style.dart';
import 'package:fruti_hub_dashboard/core/utils/build_border.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.keyboardType,
    this.validator,
    required this.controller,
    this.autovalidateMode,
    this.onChanged,
    this.textInputAction,
    this.maxLines,
  });
  final String hintText;
  final Widget prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final int? maxLines;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // rebuild when focus changes
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFocused = _focusNode.hasFocus;
    return TextFormField(
      maxLines: widget.maxLines,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      focusNode: _focusNode,
      style: TextStyles.semiBold16.copyWith(
        color: AppColors.black,
      ),
      cursorColor: AppColors.primary,

      decoration: InputDecoration(
        errorMaxLines: 2,
        errorStyle: TextStyles.semiBold13.copyWith(
          color: AppColors.red,
        ),
        prefixIcon: widget.prefixIcon,
        iconColor: isFocused ? AppColors.primary : AppColors.gray,
        prefixIconColor: isFocused ? AppColors.primary : AppColors.gray,
        hintText: widget.hintText,
        hintStyle: TextStyles.bold13.copyWith(
          color: isFocused ? AppColors.primary : AppColors.gray,
        ),
        filled: true,
        fillColor: AppColors.textFieldBorderColor,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildFocusedBorder(),
        errorBorder: buildErrorBorder(),
      ),
    );
  }
}
