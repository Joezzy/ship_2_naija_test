import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/auth_footer.dart';
import 'package:ship_to_naija/custom/btn.dart';
import 'package:ship_to_naija/custom/txt.dart';
import 'package:ship_to_naija/src/auth/presentation/get_started_view.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      // backgroundColor: AppTheme.white,
      body: Padding(
        padding: EdgeInsets.all(MySize.size10),
        child: Stack(
          children: [
            forgotForm(),
            Positioned(
                left: MySize.size30,
                top: MySize.size100,
                child: FadeInRight(
                  delay: const Duration(milliseconds: 50),
                  child: Text(
                    "Lets Recover\nYour Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MySize.size30,
                      // color: AppTheme.white
                    ),
                  ),
                )),
          ],
        ),
      ),

      bottomNavigationBar: AuthFooter(
          text: "New user? ",
          clickable: "Create User!",
          onTap: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => const GetStartedView()),
              (Route<dynamic> route) => false)),
    );
  }

  SingleChildScrollView forgotForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: MySize.size250,
        left: MySize.size20,
        right: MySize.size20,
      ),
      // margin: EdgeInsets.only(top: MySize.size250),
      physics: const NeverScrollableScrollPhysics(),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enter the email address you registered with. We will send you a password reset link.",
              style: TextStyle(
                fontSize: MySize.size14,
                // color: AppTheme.white
              ),
            ),
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
            const SizedBox(
              height: 20,
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 80),
              child: Btn(
                  text: "Send me a link ",
                  iconData: Iconsax.arrow_right_1,
                  // enabled: isLoading.value ? false : true,
                  onPressed: () {
                    // loginController.login(context);
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
    );
  }
}
