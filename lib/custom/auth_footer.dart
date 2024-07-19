import 'package:flutter/material.dart';
import 'package:ship_to_naija/core/apptheme.dart';

import '../core/sizeConfig.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.text,
    required this.clickable,
    required this.onTap,
     this.width,
  });

  final String text;
  final String clickable;
  final VoidCallback onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MySize.size100,
      child: Container(
        width: width,
        margin: EdgeInsets.symmetric(
            horizontal: MySize.size100, vertical: MySize.size28),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(MySize.size10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: TextStyle(
                  fontSize: MySize.size15,
                  // color: Colors.grey
                )),
            GestureDetector(
                onTap: onTap,
                child: Text(
                  clickable,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MySize.size15,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
