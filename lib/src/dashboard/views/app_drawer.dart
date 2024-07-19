import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/page_layout.dart';
import 'package:ship_to_naija/src/auth/presentation/login_view.dart';
import 'package:ship_to_naija/src/export/views/export_view.dart';
import 'package:ship_to_naija/src/export/views/shipping_list_view.dart';
import 'package:ship_to_naija/src/settings/views/settings_view.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    super.key,
  });

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MySize.size240,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Drawer(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: <Widget>[
                  SizedBox(
                    // padding: EdgeInsets.only(top: MySize.size20),
                    height: MySize.size220,
                    child: DrawerHeader(
                      decoration: const BoxDecoration(
                          // color: AppTheme.primaryColor
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.green[50],
                            child: const Text('JO'),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: MySize.size3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Joseph Onalo ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: MySize.size16,
                                  ),
                                ),
                                Icon(
                                  Iconsax.verify5,
                                  color: AppTheme.primaryColor,
                                  size: MySize.size18,
                                )
                              ],
                            ),
                          ),
                          Text(
                            "AES1111",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: MySize.size14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ExpansionTile(
                    title: const Text("Dashboard"),
                    leading: const Icon(
                      Icons.dashboard_outlined,
                      color: AppTheme.primaryColor,
                    ),
                    //add icon
                    childrenPadding: EdgeInsets.only(left: MySize.size40),
                  ),
                  ExpansionTile(
                    title: const Text("Shipments"),
                    leading: const Icon(
                      Iconsax.ship,
                      color: AppTheme.primaryColor,
                    ), //add icon
                    childrenPadding: EdgeInsets.only(left: MySize.size40),
                    //children padding
                    children: [
                      ListTile(
                        title: const Text("Create Shipment "),
                        onTap: () {
                          Navigator.pop(context);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExportView()));
                          //action on press
                        },
                      ),

                      ListTile(
                        title: const Text("View Shipments"),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ShippingListView()));
                        },
                      ),

                      //more child menu
                    ],
                  ),
                  ExpansionTile(
                    title: const Text("Settings"),
                    leading: const Icon(
                      Iconsax.setting,
                      color: AppTheme.primaryColor,
                    ),
                    //add icon
                    childrenPadding: EdgeInsets.only(left: MySize.size40),
                    //children paddingc
                    children: [
                      ListTile(
                        title: const Text("Account settings"),
                        onTap: () {
                          Navigator.pop(context);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingsView()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 100, left: 0, right: 0, child: comingSoonWidget()),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MenuWidget(
                  text: "Logout",
                  icon: Iconsax.logout,
                  onTap: () async {
                    Navigator.of(context, rootNavigator: true)
                        .pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const LoginView()),
                            (Route<dynamic> route) => false);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.text,
    this.iconText,
    this.icon,
    required this.onTap,
  });

  final String text;
  final String? iconText;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MySize.size10),
      child: ListTile(
        minLeadingWidth: 10,
        leading: iconText == null
            ? Icon(
                icon,
                color: AppTheme.primaryColor,
              )
            : Image.asset(
                iconText!,
                height: MySize.size16,
              ),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}

Widget comingSoonWidget() => GestureDetector(
      onTap: null,
      child: PageLayout(
        isBorder: true,
        horizontalMargin: MySize.size20,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text(
                'Coming soon!',
                style: TextStyle(color: Colors.red, fontSize: 10),
              ),
              const Text(
                'Wallet Balance',
                style: TextStyle(color: AppTheme.grey, fontSize: 11),
              ),
              Text(AppTheme.money(0.00), style: AppTheme.numericStyle())
            ],
          ),
        ),
      ),
    );
