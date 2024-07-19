import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:ship_to_naija/constants/filters.dart';
import 'package:ship_to_naija/constants/shipping_data_list.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/drop_down.dart';
import 'package:ship_to_naija/custom/page_layout.dart';
import 'package:ship_to_naija/custom/shippingCard.dart';
import 'package:ship_to_naija/custom/txt.dart';
import 'package:ship_to_naija/models/shippingData.dart';
import 'package:ship_to_naija/src/export/views/shipping_detail_view.dart';

class ShippingListView extends StatelessWidget {
  const ShippingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: MySize.size20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "View Shipment",
              style: AppTheme.formHeaderStyle(),
            ),
            SizedBox(height: MySize.size20),
            SearchTxt(
              hint: "Search ",
              onChanged: (String value) {},
              prefixIcon: const Icon(Iconsax.search_normal),
              suffixIcon: const Icon(Iconsax.refresh),
            ),
            SizedBox(height: MySize.size10),
            ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  xs: 8,
                  md: 8,
                  lg: 6,
                  child: MyDropDown(
                      hint: "Sort by",
                      value: null,
                      itemFunction: sortFilter.map((item) {
                        return DropdownMenuItem(
                          child: Text("${item.caption}"),
                          value: item.type.toString(),
                        );
                      }).toList(),
                      onChanged: (newValue) async {}),
                ),
                ResponsiveGridCol(
                  xs: 4,
                  md: 4,
                  lg: 6,
                  child: Container(
                    height: MySize.size50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppTheme.grey),
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.only(left: 8.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Export"),
                        Icon(Icons.import_export_outlined)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MySize.size20),
            PageLayout(
              horizontalMargin: 0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: shippingDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  ShippingData shippingData = shippingDataList[index];
                  return ShippingCard(
                    shipData: shippingData,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShippingDetailView(shippingData: shippingData))),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
