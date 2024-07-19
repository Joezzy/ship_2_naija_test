import 'package:flutter/cupertino.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';

class Btn extends StatelessWidget {
  final double width;
  final double? height;
  final String text;
  final Color fontColor;
  final Color enabledColor;
  final Color? borderColor;
  final Color disabledColor;
  final Color disabledButtonTextColor;
  final FontWeight fontWeight;
  final double fontSize;
  final bool enabled;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isBordered;
  final double borderRadius;
  final double activityIndicatorSize;
  final TextAlign? textAlignment;
  final TextOverflow? overflow;
  final int? maxLines;
  final double activityIndicatorLineWidth;
  final IconData? iconData;
  final Widget? imageIcon;

  const Btn(
      {Key? key,
      this.width = double.maxFinite,
      this.height,
      this.text = "Submit",
      this.disabledButtonTextColor = AppTheme.grey,
      this.fontColor = AppTheme.white,
      this.borderColor,
      this.fontWeight = FontWeight.normal,
      this.enabledColor = AppTheme.primaryColor,
      this.disabledColor = AppTheme.grey,
      this.fontSize = 16,
      this.enabled = true,
      this.isBordered = false,
      this.borderRadius = 15,
      this.activityIndicatorSize = 20,
      this.activityIndicatorLineWidth = 3,
      this.iconData,
      this.maxLines = 1,
      this.textAlignment,
      this.overflow,
      this.imageIcon,
      required this.onPressed,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen screen = AppTheme.getScreen();
    double? realHeight = height ?? MySize.size50;
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Container(
        decoration: BoxDecoration(
            color: enabled ? enabledColor : disabledColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
                color: borderColor == null ? enabledColor : borderColor!,
                width: 1)),
        height: realHeight,
        width: (screen == Screen.tab) ? width / 1.4 : width,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: fontSize, color: fontColor, fontWeight: fontWeight),
            ),
            if (iconData != null)
              Icon(
                iconData,
                color: fontColor,
              )
          ],
        )),
      ),
    );
  }
}
