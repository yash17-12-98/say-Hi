import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final void Function(String)? onChanged;
  final String? errorText;
  final String? labelText;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final bool? isBorder;
  final String? Function(String?)? validator;

  const CommonTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.errorText,
    this.labelText,
    this.prefixIcon,
    this.textInputType = TextInputType.none,
    this.isBorder = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      keyboardType: textInputType,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        focusColor: Colors.white,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: isBorder == false
                ? BorderSide.none
                : const BorderSide(color: Colors.blue)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: isBorder == false
                ? BorderSide.none
                : const BorderSide(color: Colors.blue)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: isBorder == false
                ? BorderSide.none
                : const BorderSide(color: Colors.blue)),
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
