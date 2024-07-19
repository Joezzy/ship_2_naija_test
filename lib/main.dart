import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ship_to_naija/src/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.01),
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ship to Naija",
      theme: ThemeData(
        useMaterial3: true,
      ),

      home: SplashScreen(),
    );
  }
}

