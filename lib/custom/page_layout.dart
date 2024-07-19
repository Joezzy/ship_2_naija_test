import 'package:flutter/material.dart';
import 'package:ship_to_naija/core/apptheme.dart';

class PageLayout extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double borderRadius;
  final double? horizontalPadding;
  final double verticalPadding;
  final double? horizontalMargin;
  final double? verticalMargin;
  final Color backgroundColor;
  final bool isBorder;

  const PageLayout({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.horizontalPadding = 15,
    this.verticalPadding = 10,
    this.borderRadius = 10,
    this.horizontalMargin = 10,
    this.verticalMargin = 10,
    this.isBorder = false,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding!, vertical: verticalPadding),
      margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin!, vertical: verticalMargin!),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: isBorder
              ? Border.all(color: AppTheme.black.withOpacity(0.05), width: 1)
              : null),
      child: child,
    );
  }
}
