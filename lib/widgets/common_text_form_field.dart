import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool? multiLine;
  final bool isObscure;
  final FormFieldValidator<String>? validator;
  final TextStyle? hintTextStyle;
  final double? borderRadius;
  final TextInputAction textInputAction;
  final bool? isPadding;
  final bool isDense;
  final bool? isEnable;
  final bool? read;
  final bool? scroll;
  final bool? autofocus;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? suffix;
  final List<TextInputFormatter>? listTextInput;
  final InputBorder? enabledBorder;
  final Function(String)? onChanged;
  final TextCapitalization? textCapitalization;
  final Function(String)? onFieldSubmitted;

  const CommonTextFormField({
    Key? key,
    this.controller,
    this.hintText = '',
    this.keyboardType,
    this.multiLine = false,
    this.labelText,
    this.isObscure = false,
    this.hintTextStyle/*= const TextStyle(height:2.8,color: ColorsConfig.colorLightDarkBlue)*/,
    this.validator,
    this.borderRadius = 10.0,
    this.textInputAction = TextInputAction.done,
    this.isPadding = true,
    this.isDense = true,
    this.listTextInput,
    this.isEnable = true,
    this.suffixIcon,
    this.enabledBorder,
    this.onChanged,
    this.read = false,
    this.scroll = false,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus!,
      obscureText: isObscure,
      validator: validator,
      controller: controller,
      inputFormatters: listTextInput,
      enabled: isEnable,
      readOnly: read!,
      scrollPadding:
          scroll == true ? const EdgeInsets.only(bottom: 300) : EdgeInsets.zero,
      // multiLine == false ? null : [LengthLimitingTextInputFormatter(500),FilteringTextInputFormatter.digitsOnly],
      // style: CustomTextStyle.textFieldTextStyle,
      keyboardType: keyboardType,
      maxLines: multiLine == true ? 9 : 1,
      onChanged: onChanged,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization!,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        // contentPadding: isPadding!
        //     ? const EdgeInsets.fromLTRB(20, 0, 12, 0)
        //     : const EdgeInsets.fromLTRB(20, 0, 12, 30),
        focusColor: Colors.white,
        isDense: isDense,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffix: suffix,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide.none),
        enabledBorder: enabledBorder,
        filled: true,
        // fillColor: ColorsConfig.colorLightGrey,
        labelText: labelText,
        // labelStyle: CustomTextStyle.dropDownLabelTextStyle,
        // floatingLabelStyle: CustomTextStyle.dropDownFloatingLabelTextStyle,
        hintText: hintText,
        hintStyle: hintTextStyle,
      ),
    );
  }
}
