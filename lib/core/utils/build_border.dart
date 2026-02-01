import 'package:flutter/material.dart';
import 'package:fruti_hub_dashboard/core/utils/app_colors.dart';

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(
      color: AppColors.textFieldBorderColor,
      width: 1,
    ),
  );
}

OutlineInputBorder buildFocusedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(color: AppColors.primary, width: 2),
  );
}

OutlineInputBorder buildErrorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(color: AppColors.red, width: 1),
  );
}
