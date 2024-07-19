import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';

class Txt extends StatelessWidget {
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;

  final bool isPasswordField;
  final bool isEnabled;
  final bool readOnly;
  final bool denySpaces;
  final String hintText;
  final Color hintColor;
  final String initialValue;
  final double width;
  final double borderRadius;
  final double height;
  final int maxLength;
  final int maxLine;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Function()? onSuffixItemTapped;
  final Function()? onPrefixItemTapped;
  final EdgeInsetsGeometry? contentPadding;
  final bool isNaira;
  final bool alignCenter;

  const Txt({
    Key? key,
    this.validator,
    this.isPasswordField = false,
    this.denySpaces = false,
    this.isEnabled = true,
    this.hintText = "",
    this.initialValue = '',
    this.width = double.infinity,
    this.borderRadius = 6,
    this.height = 20,
    this.textStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.maxLength = 80,
    this.maxLine = 1,
    this.onSuffixItemTapped,
    this.onPrefixItemTapped,
    this.keyboardType,
    this.controller,
    this.contentPadding,
    this.onChanged,
    this.isNaira = false,
    this.alignCenter = false,
    this.hintColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool usesSuffixIcon = (suffixIcon != null);
    bool usesPrefixIcon = (prefixIcon != null);
    Screen screen = AppTheme.getScreen();
    return FadeInRight(
      delay: const Duration(milliseconds: 30),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: MySize.size5),
        width: (screen == Screen.tab) ? width / 1.4 : width,
        child: TextFormField(
          enabled: isEnabled,
          onChanged: onChanged,
          controller: controller,
          validator: validator,
          obscureText: isPasswordField,
          maxLines: maxLine,
          readOnly: readOnly,
          maxLength: maxLength,
          keyboardType: isNaira && keyboardType == null
              ? TextInputType.number
              : keyboardType,
          inputFormatters: (keyboardType == TextInputType.number)
              ? [
                  FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                ]
              : denySpaces
                  ? [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ]
                  : null,
          textAlign: alignCenter ? TextAlign.center : TextAlign.left,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: MySize.size14, color: hintColor),
            counterText: "",
            // errorStyle: const TextStyle(color: AppTheme.black),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppTheme.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),

            // border:  OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(20.0),
            //   borderSide: const BorderSide(
            //     color: AppTheme.lightGrey,
            //     width: 0,
            //   ),
            //
            //  ),

            // filled: true,
            fillColor: AppTheme.grey,
            prefixIcon: usesPrefixIcon
                ? InkWell(
                    onTap: onPrefixItemTapped,
                    enableFeedback: true,
                    child: prefixIcon,
                  )
                : null,

            suffixIcon: usesSuffixIcon
                ? GestureDetector(
                    onTap: onSuffixItemTapped,
                    // enableFeedback: true,
                    child: suffixIcon,
                  )
                : null,
            contentPadding: (contentPadding == null)
                ? EdgeInsets.symmetric(vertical: 0, horizontal: MySize.size25)
                : contentPadding,
          ),
          style: textStyle,
        ),
      ),
    );
  }
}

class SearchTxt extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? multiSwitch;
  final String hint;
  final TextInputType? inputType;
  final bool hashValue;
  final VoidCallback? searchFunction;
  final double borderRadius;
  final double width;
  final Color hintColor;
  final Function(String value)? onChanged;

  const SearchTxt(
      {Key? key,
      this.controller,
      this.borderRadius = 5,
      this.width = 400,
      required this.onChanged,
      this.hint = '',
      this.prefixIcon,
      this.suffixIcon,
      this.inputType,
      this.multiSwitch,
      this.searchFunction,
      this.hintColor = Colors.grey,
      this.hashValue = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return      FadeInDown(
      delay: const Duration(milliseconds: 20),
      child: SizedBox(
        width: width,
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: MySize.size14, color: hintColor),
            counterText: "",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppTheme.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppTheme.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppTheme.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            // filled: true,
            fillColor: const Color(0xFFC4C4C4).withOpacity(0.2),
            contentPadding: EdgeInsets.symmetric(
              vertical: MySize.size10,
              horizontal: MySize.size15,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          style: TextStyle(fontSize: MySize.size18),
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label({super.key, required this.label, required this.child});

  final Widget child;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MySize.size10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(label), child],
      ),
    );
  }
}
