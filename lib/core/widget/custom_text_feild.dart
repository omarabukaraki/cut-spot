import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hintText,
      required this.withIcon,
      this.iconButton,
      this.controller,
      this.onChanged,
      this.obscureText = false});
  final String hintText;
  final bool withIcon;
  final VoidCallback? iconButton;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        obscureText: obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
          return null;
        },
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: withIcon
                ? IconButton(
                    onPressed: iconButton,
                    icon: const Icon(
                      size: 20,
                      Icons.remove_red_eye,
                      color: AppColor.kFontGray,
                    ))
                : const Icon(
                    Icons.remove_red_eye,
                    color: Colors.transparent,
                  ),
            hintText: hintText,
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            errorStyle: const TextStyle(fontSize: 0, color: Colors.red),
            hintStyle: const TextStyle(color: AppColor.kFontGray, fontSize: 13),
            contentPadding: const EdgeInsets.all(16),
            border: const OutlineInputBorder()),
      ),
    );
  }
}
