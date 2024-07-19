import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/btn.dart';
import 'package:ship_to_naija/custom/page_layout.dart';
import 'package:ship_to_naija/src/dashboard/views/app_drawer.dart';
import 'package:ship_to_naija/src/dashboard/views/dash_app_bar.dart';
import 'package:ship_to_naija/src/export/views/export_view.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      drawer: const AppDrawer(),
      appBar: ProfileAppBar(
        title: "Hi, Joseph",
        onTapLeadingIcon: () {
          if (_scaffoldKey.currentState!.isDrawerOpen) {
            _scaffoldKey.currentState!.openEndDrawer();
          } else {
            _scaffoldKey.currentState!.openDrawer();
          }
        },
      ),

      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: MySize.size20,
            ),
            Column(
              children: [
                ResponsiveGridRow(children: [
                  ResponsiveGridCol(
                    xs: 12,
                    md: 6,
                    lg: 6,
                    child: FadeInLeft(
                      delay: const Duration(milliseconds: 20),
                      child: PageLayout(
                        verticalMargin: 5,
                        height: MySize.size110,
                        verticalPadding: MySize.size15,
                        // padding:  EdgeInsets.symmetric(vertical: MySize.size20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              // width: MySize.size100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Number of shipments this month",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "0",
                                    style: AppTheme.numericStyle(),
                                  ),
                                  const Text("0% against last month"),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Btn(
                                    width: MySize.size100,
                                    height: MySize.size25,
                                    fontSize: MySize.size10,
                                    enabledColor: AppTheme.primaryColor,
                                    text: "New shipment +",
                                    onPressed: () =>  Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ExportView()))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 12,
                    md: 6,
                    lg: 6,
                    child: FadeInRight(
                      delay: const Duration(milliseconds: 20),
                      child: PageLayout(
                        verticalMargin: 5,
                        height: MySize.size120,
                        verticalPadding: MySize.size15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Total shipping cost for this month",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "0",
                              style: AppTheme.numericStyle(),
                            ),
                            const Text("0% against last month"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
            kycWidget(),
            savedAddressWidget(),
            ResponsiveGridRow(children: [
              ResponsiveGridCol(
                xs: 6,
                md: 5,
                lg: 4,
                child: CountCard(
                  text: "Total shipment",
                  icon: Icon(
                    Icons.local_shipping_outlined,
                    size: MySize.size20,
                  ),
                  count: 3,
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 5,
                lg: 4,
                child: CountCard(
                  text: "shipment in transit",
                  icon: Icon(
                    Icons.update,
                    size: MySize.size20,
                    color: Colors.amber,
                  ),
                  count: 0,
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 5,
                lg: 4,
                child: CountCard(
                  text: "Delivered shipment",
                  icon: Icon(
                    Icons.done_all_outlined,
                    size: MySize.size20,
                    color: Colors.green,
                  ),
                  count: 2,
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 5,
                lg: 4,
                child: CountCard(
                  text: "Cancel shipment",
                  icon: Icon(
                    Icons.remove_circle,
                    size: MySize.size20,
                    color: Colors.redAccent,
                  ),
                  count: 1,
                ),
              ),
            ]),
            SizedBox(
              height: MySize.size20,
            )
          ],
        ),
      ),
    );
  }

  FadeInRight savedAddressWidget() {
    return FadeInRight(
      delay: const Duration(milliseconds: 20),
      child: PageLayout(
              verticalMargin: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Saved Address'),
                      Text('3', style: AppTheme.numericStyle()),
                      const Text('View')
                    ],
                  ),
                  const Icon(Icons.map_outlined, size: 50,color: Colors.amber,)
                ],
              ),
            ),
    );
  }

  FadeInLeft kycWidget() {
    return FadeInLeft(
      delay: const Duration(milliseconds: 20),
      child: PageLayout(
        verticalMargin: 5,
        height: MySize.size120,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('KYC Progress'),
                  Text('100%', style: AppTheme.numericStyle()),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox(
                          width: MySize.size250,
                          child: const LinearProgressIndicator(
                              color: AppTheme.primaryColor,
                              backgroundColor: AppTheme.grey,
                              value: 0.5)))
                ],
              ),
              const Icon(Icons.bar_chart_outlined, size: 50,color: AppTheme.primaryColor,)
            ],
          ),
        ),
      ),
    );
  }
}

class CountCard extends StatelessWidget {
  const CountCard({
    super.key,
    required this.text,
    required this.icon,
    required this.count,
  });

  final String text;
  final Widget icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 20),
      child: PageLayout(
        verticalMargin: 5,
        horizontalPadding: MySize.size20,
        verticalPadding: MySize.size8,
        height: MySize.size100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon,
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: MySize.size12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MySize.size10,
            ),
            Text(
              count.toString(),
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: MySize.size30),
            ),
          ],
        ),
      ),
    );
  }
}
