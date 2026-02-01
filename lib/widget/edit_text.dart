import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final double? fontSize;
  final double? hintFontSize;
  final Color? textColor;
  final Color? hintTextColor;
  final FontWeight? fontWeight;
  final bool? enabled;
  final bool? obscureText;
  final String? labelText;
  final TextEditingController? controller;
  final TextAlignVertical? textAlignVertical;
  final InputBorder? border;
  final Color? cursorColor;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final ValueChanged<String>? onChanged;

  final Widget? suffixIcon;
  final Size? suffixIconSize;

  const EditText({
    super.key,
    this.fontSize,
    this.hintFontSize,
    this.textColor,
    this.hintTextColor,
    this.fontWeight,
    this.enabled,
    this.obscureText,
    this.labelText,
    this.controller,
    this.textAlignVertical,
    this.border,
    this.cursorColor,
    this.keyboardType,
    this.padding,
    this.onChanged,
    this.suffixIcon,
    this.suffixIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlignVertical: textAlignVertical,
      obscureText: obscureText ?? false,
      enabled: enabled,
      cursorColor: cursorColor,
      keyboardType: keyboardType,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        textBaseline: TextBaseline.alphabetic,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: labelText,
        isDense: true,
        hintStyle: TextStyle(
          fontSize: hintFontSize ?? fontSize,
          color: hintTextColor,
          textBaseline: TextBaseline.alphabetic,
        ),
        border: border ?? InputBorder.none,
        contentPadding: padding,
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconSize == null
            ? null
            : BoxConstraints(
                minWidth: suffixIconSize!.width,
                minHeight: suffixIconSize!.height,
                maxHeight: suffixIconSize!.height,
                maxWidth: suffixIconSize!.width,
              ),
      ),
    );
  }
}
