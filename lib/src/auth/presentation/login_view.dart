import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/auth_footer.dart';
import 'package:ship_to_naija/custom/btn.dart';
import 'package:ship_to_naija/custom/txt.dart';
import 'package:ship_to_naija/src/auth/presentation/forgot_password_view.dart';
import 'package:ship_to_naija/src/auth/presentation/get_started_view.dart';

import 'package:ship_to_naija/src/dashboard/views/dash_board_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool showPassword = true;
  bool isRemember = true;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      // backgroundColor: AppTheme.white,
      body: Stack(
        children: [
          loginForm(),
          Positioned(
              left: MySize.size30,
              top: MySize.size100,
              child: FadeInRight(
                delay: const Duration(milliseconds: 50),
                child: Text(
                  "Login to your\n Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MySize.size30,
                    // color: AppTheme.white
                  ),
                ),
              )),
        ],
      ),
      bottomNavigationBar: AuthFooter(
          text: "New user? ",
          clickable: "Sign up!",
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GetStartedView()))),
    );
  }

  SingleChildScrollView loginForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: MySize.size250,
        left: MySize.size20,
        right: MySize.size20,
      ),
      // margin: EdgeInsets.only(top: MySize.size250),
      physics: const NeverScrollableScrollPhysics(),
      child: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MySize.size15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInLeft(
                delay: const Duration(milliseconds: 50),
                child: Label(
                  label: "Email",
                  child: Txt(
                    hintText: "Enter email",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppTheme.grey,
                      size: MySize.size20,
                    ),
                    denySpaces: true,
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size10,
              ),
              FadeInLeft(
                delay: const Duration(milliseconds: 50),
                child: Label(
                  label: "Password",
                  child: Txt(
                    hintText: "Enter password",
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: AppTheme.grey,
                      size: MySize.size20,
                    ),
                    isPasswordField: showPassword,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: Icon(
                        showPassword
                            ? MdiIcons.eyeOutline
                            : MdiIcons.eyeOffOutline,
                        color: AppTheme.black.withOpacity(.5),
                      ),
                    ),
                    onSuffixItemTapped: () {
                      setState(() {
                        if (!showPassword) {
                          showPassword = true;
                        } else {
                          showPassword = false;
                        }
                      });
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordView()));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MySize.size5),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            fontSize: MySize.size13,
                            color: AppTheme.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Remember me', style: TextStyle(
                          fontSize: MySize.size13,
                          color: AppTheme.primaryColor),),

                      Checkbox(value: isRemember,
                          checkColor: Colors.white,
                          activeColor: AppTheme.primaryColor,
                          onChanged: (val) {
                        setState(() {
                          isRemember=val!;
                        });
                      }),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FadeInLeft(
                delay: const Duration(milliseconds: 80),
                child: Btn(
                    text: "Login ",
                    iconData: Iconsax.arrow_right_1,
                    // enabled: isLoading.value ? false : true,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashBoardView()));
                    }),
              ),
              SizedBox(
                height: MySize.size25,
              ),
              SizedBox(
                height: MySize.size5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
