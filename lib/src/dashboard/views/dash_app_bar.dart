import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/src/dashboard/views/notification_view.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget? rightIcon;

  MyAppBar({super.key, this.title = "", this.rightIcon})
      : preferredSize = const Size.fromHeight(40);

  @override
  final Size preferredSize;

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(MySize.size100),
      // here the desired height

      child: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: MySize.size24),
        ),
        iconTheme: const IconThemeData(color: AppTheme.primaryColor),
        elevation: 0,
        actions: widget.rightIcon != null ? [widget.rightIcon!] : null,
        // backgroundColor: AppTheme.o3Background,
        backgroundColor: AppTheme.backgroundColor.withOpacity(0.1),
      ),
    );
  }
}

class ProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onTapLeadingIcon;

  ProfileAppBar({Key? key, this.title = "", this.onTapLeadingIcon})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      // here the desired height

      child: AppBar(
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage("assets/images/avatar.png")),
            Text(
              " Hi, Joseph",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: MySize.size20),
            ),
          ],
        ),
        leading: InkWell(
            onTap: widget.onTapLeadingIcon!, child: const Icon(Iconsax.menu_1)),
        iconTheme: const IconThemeData(color: AppTheme.primaryColor),
        elevation: 0,
        actions: [
          // Icon(Iconsax.notification,size: 20,),
          ConstrainedBox(
            constraints: const BoxConstraints.expand(height: 200, width: 57),
            child: IconButton(
              icon: Container(
                  height: MySize.size80,
                  width: MySize.size80,
                  decoration: BoxDecoration(
                      color: AppTheme.grey.withOpacity(.1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: MySize.size5,
                                vertical: MySize.size5),
                            child: const Icon(Iconsax.notification)),
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 18,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppTheme.red,
                                borderRadius:
                                    BorderRadius.circular(MySize.size10)),
                            child: Center(
                                child: Text(
                              "3",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.white,
                                  fontSize: MySize.size10),
                            )),
                          ),
                        )
                      ],
                    ),
                  )),
              onPressed: () {
                // fireDb.sendNotification(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationView()));
              },
            ),
          ),
        ],
        backgroundColor: Colors.white,
        // backgroundColor: AppTheme.o3Background,
      ),
    );
  }
}
