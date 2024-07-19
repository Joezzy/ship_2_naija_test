import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/auth_footer.dart';
import 'package:ship_to_naija/custom/btn.dart';
import 'package:ship_to_naija/custom/txt.dart';
import 'package:ship_to_naija/src/auth/presentation/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? country;
  bool showPassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(MySize.size10),
        child: Stack(
          children: [
            signUpForm(),
          ],
        ),
      ),
    ),
      bottomNavigationBar: AuthFooter(
          text: "Existing user? ",
          clickable: "Login up!",
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginView()))),
    );
  }

  Container signUpForm() {
    return Container(
      padding: EdgeInsets.only(
        top: MySize.size50,
        left: MySize.size20,
        right: MySize.size20,
      ),

      // margin: EdgeInsets.only(top: MySize.size250),
      // physics: const NeverScrollableScrollPhysics(),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInRight(
              delay: const Duration(milliseconds: 50),
              child: Text(
                "Enter Your\nDetail To Proceed",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MySize.size20,
                  // color: AppTheme.white
                ),
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 50),
              child: Column(
                children: [
                  const Label(
                    label: "First Name",
                    child: Txt(
                      hintText: 'Enter first name',
                    ),
                  ),
                  const Label(
                    label: "Last Name",
                    child: Txt(
                      hintText: 'Enter last name',
                    ),
                  ),
                  const Label(
                    label: "Middle Name (Optional)",
                    child: Txt(
                      hintText: 'Enter middle name',
                    ),
                  ),
                  const Label(
                    label: "Email",
                    child: Txt(
                      hintText: 'Enter name',
                    ),
                  ),
                  Label(
                    label: "Password",
                    child: Txt(
                      hintText: 'Enter password',
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
                        if (!showPassword) {
                          showPassword = true;
                        } else {
                          showPassword = false;
                        }
                      },
                    ),
                  ),
                  Label(
                    label: "Confirm Password",
                    child: Txt(
                      hintText: 'Confirm password',
                      // controller: registerController.passwordController2,
                      // validator: registerController.validator.passwordValidator,
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
                        if (!showPassword) {
                          showPassword = true;
                        } else {
                          showPassword = false;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FadeInRight(
              delay: const Duration(milliseconds: 100),
              child: Btn(
                text: "sign_up",
                onPressed: () {
                  // registerController.registerMethod(context);
                },
              ),
            ),


            SizedBox(
              height: MySize.size10,
            ),


            SizedBox(
              height: MySize.size50,
            )
          ],
        ),
      ),
    );
  }
}
