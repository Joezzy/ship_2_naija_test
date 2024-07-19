import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/auth_footer.dart';
import 'package:ship_to_naija/custom/btn.dart';
import 'package:ship_to_naija/src/auth/presentation/register_view.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  int selected = 0;
  bool showPassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  selectUserType(int type) {
    setState(() {
      selected = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(MySize.size10),
            child: signUpForm(),
          ),
        ),
        bottomNavigationBar: AuthFooter(
            text: "Existing user? ",
            clickable: "Login",
            onTap: () => Navigator.pop(context)));
  }

  Container signUpForm() {
    return Container(
      padding: EdgeInsets.only(
        top: MySize.size60,
        left: MySize.size20,
        right: MySize.size20,
      ),

      // margin: EdgeInsets.only(top: MySize.size250),
      // physics: const NeverScrollableScrollPhysics(),
      child: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MySize.size16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInRight(
                delay: const Duration(milliseconds: 50),
                child: Text(
                  "Let's\nGet Started",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MySize.size30,
                    // color: AppTheme.white
                  ),
                ),
              ),
              Text(
                "Kindly select a category that best suits you.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: MySize.size14,
                  // color: AppTheme.white
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              UserTypeWidget(
                  text: "New Customer",
                  icon: Iconsax.user,
                  value: 0,
                  selected: selected,
                  onTap: () => selectUserType(0)),
              UserTypeWidget(
                text: "Existing Customer",
                icon: Iconsax.user_edit,
                value: 1,
                selected: selected,
                onTap: () => selectUserType(1),
              ),
              const SizedBox(
                height: 20,
              ),
              selected == 0
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "For New Customer",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Upon completion of your signup process,"
                            " a unique unit number will be automatically "
                            "generated for your account. You can then use this"
                            " unit number to log in and access our services")
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Coming soon!",
                          style: TextStyle(color: AppTheme.primaryColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "For Existing Customers",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          // textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome back! ',
                                style: TextStyle(
                                    color: AppTheme.black,
                                    fontSize: MySize.size14,
                                    fontWeight: FontWeight.w500
                                    // fontFamily: 'Raleway'
                                    ),
                              ),
                              TextSpan(
                                text:
                                    "We recognize you've exported with us previously. "
                                    "To expedite your signup, enter your existing unit number on the "
                                    "form after clicking 'Continue.' If you need help finding your "
                                    "unit number, our support team is happy to assist! ",
                                style: TextStyle(
                                  color: AppTheme.black.withOpacity(.7),
                                  fontSize: MySize.size14,
                                  // fontFamily: 'Raleway',
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
               SizedBox(
                height: MySize.size40,
              ),
              FadeInRight(
                delay: const Duration(milliseconds: 100),
                child: Btn(
                  text: "Continue",
                  enabled: selected == 0,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterView())),
                ),
              ),
              SizedBox(
                height: MySize.size50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserTypeWidget extends StatelessWidget {
  const UserTypeWidget({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.value,
    required this.selected,
  });

  final VoidCallback onTap;
  final String text;
  final IconData icon;
  final int value;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: const Duration(milliseconds: 50),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: MySize.size110,
          margin: EdgeInsets.only(bottom: MySize.size20),
          padding: EdgeInsets.symmetric(horizontal: MySize.size20),
          decoration: BoxDecoration(
              color: selected == value ? AppTheme.secondaryColor : null,
              border: Border.all(color: AppTheme.grey, width: 1),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon),
              SizedBox(
                height: MySize.size10,
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
