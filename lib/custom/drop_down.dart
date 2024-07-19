import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';

class MyDropDown extends StatelessWidget {
  final Widget suffixIcon;
  final String hint;
  final String? value;
  final double width;
  final double borderRadius;
  final String? label;
  final String placeholderText;
  void Function(String? item)? onChanged;
  final List<DropdownMenuItem<String>> itemFunction;

  MyDropDown({
    super.key,
    this.value,
    this.hint = "",
    this.label,
    this.placeholderText = "",
    this.width = double.maxFinite,
    this.suffixIcon = const Text("show"),
    required this.itemFunction,
    this.onChanged,
    this.borderRadius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: const Duration(milliseconds: 20),
      child: SizedBox(
        width: width,
        child: DropdownButtonFormField<String>(
          value: value,
          icon: const Visibility(
              visible: true, child: Icon(Icons.keyboard_arrow_down)),
          style: TextStyle(
              color: AppTheme.black,
              fontSize: MySize.size14,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w600),
          hint: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                hint,
                style: TextStyle(
                  fontSize: MySize.size14,
                  fontWeight: FontWeight.normal,
                  color: AppTheme.black.withOpacity(0.3),
                ),
              )),

          // decoration: InputDecoration(
          //     hintText: placeholderText,
          //     hintStyle: TextStyle(fontSize: MySize.size13),
          //     label: label==null?null:Text("$label"),
          //     labelStyle: TextStyle(fontSize: MySize.size13),
          //     floatingLabelBehavior: FloatingLabelBehavior.always,            counterText: "",
          //     border: InputBorder.none,
          //     filled: true,
          //     fillColor: AppTheme.grey,
          //     contentPadding: EdgeInsets.symmetric(
          //         vertical: MySize.size10,
          //         horizontal: MySize.size14
          //     )),
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  fontSize: MySize.size14,
                  color: AppTheme.black.withOpacity(0.3)),
              counterText: "",
              errorStyle: const TextStyle(color: AppTheme.black),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppTheme.grey,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppTheme.grey,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppTheme.grey,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppTheme.grey,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              // filled: true,
              fillColor: AppTheme.grey,
              // prefixIcon:  usesPrefixIcon
              //     ? GestureDetector(
              //   onTap: onPrefixItemTapped,
              //   enableFeedback: true,
              //   child: prefixIcon,
              // ): null,

              // suffixIcon: usesSuffixIcon
              //     ? GestureDetector(
              //   onTap: onSuffixItemTapped,
              //   enableFeedback: true,
              //   child: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20)),

          isExpanded: true,
          onChanged: onChanged,
          items: itemFunction,
          isDense: true,

          menuMaxHeight: MySize.size300,
          // you need for height
        ),
      ),
    );
  }
}

class MyDropDown2 extends StatelessWidget {
  final Widget suffixIcon;
  final String hint;
  final String? value;
  final double width;
  final double borderRadius;
  final String? label;
  final String placeholderText;
  final void Function(String? item)? onChanged;
  final List<DropdownMenuItem<String>> itemFunction;

  const MyDropDown2({
    super.key,
    this.value,
    this.hint = "",
    this.label,
    this.placeholderText = "",
    this.width = double.maxFinite,
    this.suffixIcon = const Text("show"),
    required this.itemFunction,
    this.onChanged,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: MySize.size42,
      child: DropdownButtonFormField<String>(
        value: value,
        icon: const Visibility(
            visible: true, child: Icon(Icons.keyboard_arrow_down)),
        style: TextStyle(
            color: AppTheme.black,
            fontSize: MySize.size14,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w600),

        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: MySize.size14,
                color: AppTheme.black.withOpacity(0.3)),
            counterText: "",
            errorStyle: const TextStyle(color: AppTheme.black),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppTheme.black,
                width: .5,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppTheme.black,
                width: .5,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppTheme.black,
                width: .5,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppTheme.black,
                width: .5,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            // filled: true,
            // fillColor: AppTheme.grey,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20)),

        isExpanded: true,
        onChanged: onChanged,
        items: itemFunction,
        isDense: true,
        // menuMaxHeight:MySize.size60,
        // you need for height
      ),
    );
  }
}
