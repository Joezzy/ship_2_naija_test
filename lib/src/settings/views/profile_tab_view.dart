import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/btn.dart';
import 'package:ship_to_naija/custom/page_layout.dart';
import 'package:ship_to_naija/custom/txt.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MySize.screenHeight,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            FadeInLeft(
              delay: const Duration(milliseconds: 20),
              child: PageLayout(
                width: MySize.screenWidth,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.green[50],
                        child: const Text('JO'),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Joseph Onalo',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        'onalo@gmail.com',
                      ),
                      const Text(
                        'Date Joined: 06/07/2024',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeInRight(
              delay: const Duration(milliseconds: 20),
              child: PageLayout(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Add Address',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green[50],
                            child: const Icon(Icons.place),
                          ),
                          const SizedBox(width: 8),
                          const Text('Tap to add additional address'),
                          const Spacer(),
                          const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total addresses saved'),
                          PageLayout(
                            horizontalPadding: 8,
                            verticalPadding: 5,
                            borderRadius: 5,
                            child: const Text("3"),
                            backgroundColor: Colors.amber.withOpacity(0.5),
                            width: MySize.size28,
                            height: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeInLeft(
              delay: const Duration(milliseconds: 20),
              child: const PageLayout(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Business Details',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('---'),
                              Text(
                                'Business Name',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Individual'),
                              Text(
                                'Account Type',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeInLeft(
              delay: const Duration(milliseconds: 20),
              child: PageLayout(
                // borderSide: borderSide,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Edit Profile',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20),
                      ToggleSwitch(
                        minWidth: MySize.size100,
                        cornerRadius: 20.0,
                        activeBgColors: [
                          [Colors.green[800]!],
                          [Colors.green[800]!]
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: AppTheme.grey,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: 0,
                        totalSwitches: 2,
                        labels: const ['Detail', 'Password'],
                        radiusStyle: true,
                        onToggle: (index) {},
                      ),
                      const SizedBox(height: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Label(
                            label: 'First Name',
                            child: Txt(
                              hintText: 'Enter first name',
                              prefixIcon: Icon(
                                Iconsax.user,
                                color: AppTheme.grey,
                              ),
                            ),
                          ),
                          Label(
                            label: 'Last Name',
                            child: Txt(
                              hintText: 'Enter last name',
                              prefixIcon: Icon(
                                Iconsax.user,
                                color: AppTheme.grey,
                              ),
                            ),
                          ),
                          Label(
                            label: 'Middle Name',
                            child: Txt(
                              hintText: 'Enter middle name',
                              prefixIcon: Icon(
                                Iconsax.user,
                                color: AppTheme.grey,
                              ),
                            ),
                          ),
                          Label(
                            label: 'Unit Number ',
                            child: Txt(
                              hintText: 'Enter unit  number',
                              prefixIcon: Icon(
                                Iconsax.hashtag,
                                color: AppTheme.grey,
                              ),
                            ),
                          ),
                          Label(
                            label: 'Email  ',
                            child: Txt(
                              hintText: 'Enter email address',
                              prefixIcon: Icon(
                                Iconsax.house,
                                color: AppTheme.grey,
                              ),
                            ),
                          ),
                          Label(
                            label: 'Phone Number ',
                            child: Txt(
                              hintText: 'Enter phone number',
                              prefixIcon: Icon(
                                Iconsax.call,
                                color: AppTheme.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 14),
                      const SizedBox(height: 30),
                      Btn(
                        text: 'Update Account',
                        fontColor: Colors.green,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            PageLayout(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Coming soon!',
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Refer a business and earn!',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      'Share your referral link with a business and earn N5000 when they signup and book a shipment.',
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Share the referral link',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      'Share the referral link by copying and sharing it on social media.',
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                    const SizedBox(height: 8),
                    PageLayout(
                      backgroundColor: Colors.grey.shade100,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'HGTUOJHLO234',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Copy link',
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MySize.size200,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
