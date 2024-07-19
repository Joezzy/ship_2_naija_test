import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/src/auth/presentation/login_view.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "splash";

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => moveOn());
  }

  int initScreen = 1;

  moveOn() async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => const LoginView()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.primaryColor,
        body: GestureDetector(
          onTap: () {},
          child: Stack(children: <Widget>[

            Image.asset(
              'assets/images/img4.png',
              height: MySize.screenHeight,
              fit: BoxFit.cover
            ),
            Positioned(
              top: -10,
              left: 40,
              right: 60,
              child: FadeInUp(
                delay: const Duration(milliseconds: 100),
                child: Image.asset(
                  'assets/images/africanies.png',
                  width: MySize.size300,
                  height: MySize.size300,
                  fit: BoxFit.contain,
                  // color: AppTheme.pr,
                ),
              ),
            ),
          ]),
        ));
  }
}
