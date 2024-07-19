import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/page_layout.dart';
import 'package:ship_to_naija/models/shippingData.dart';

class ShippingDetailView extends StatelessWidget {
  final ShippingData shippingData;

  const ShippingDetailView({super.key, required this.shippingData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Text(
                "Shipment Breakdown",
                style: AppTheme.formHeaderStyle(),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: MySize.size20),
                  child: Text(
                    "Shipping Details",
                    style: AppTheme.detailHeaderStyle(),
                  ),
                ),
                SizedBox(
                  height: MySize.size15,
                ),
                FadeInLeft(
                  delay: const Duration(milliseconds: 20),
                  child: const PageLayout(
                    child: Column(
                      children: [
                        RowHeader(
                          text: "Customer Information",
                        ),
                        RowHeader(
                          text: "Sender Information",
                        ),
                        RowHeader(
                          text: "Receivers Information",
                        ),
                        RowHeader(
                          text: "Warehouse Information",
                        ),
                      ],
                    ),
                  ),
                ),
                FadeInLeft(
                  delay: const Duration(milliseconds: 20),
                  child: PageLayout(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Detail",
                        style: AppTheme.detailHeaderStyle(),
                      ),
                      SizedBox(
                        height: MySize.size15,
                      ),
                      const Divider(
                        color: AppTheme.grey,
                      ),
                      OrderBody(text: "Date", value: shippingData.dateCreated),
                      OrderBody(
                          text: "Shipment ID", value: shippingData.shippingId),
                      OrderBody(
                          text: "Tracking Number",
                          value: shippingData.trackingId),
                      OrderBody(
                          text: "Destination", value: shippingData.destination),
                      OrderBody(
                          text: "Shipment status",
                          value: shippingData.shippingStatus),
                      OrderBody(
                          text: "Approval status",
                          value: shippingData.approvalStatus),
                      OrderBody(
                          text: "Payment status",
                          value: shippingData.paymentStatus),
                    ],
                  )),
                ),
                PageLayout(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Summary",
                      style: AppTheme.detailHeaderStyle(),
                    ),
                    SizedBox(
                      height: MySize.size15,
                    ),
                    const Text("Ref Number: EX-AIES-000001-000016"),
                    SizedBox(
                      height: MySize.size10,
                    ),
                    const Text("Shipment Method: African Air standard"),
                    const miniHeader(
                      text: "Box 1",
                    ),
                    SizedBox(
                      height: MySize.size10,
                    ),
                    const miniHeader(
                      text: "Additional   charge",
                    ),
                    const Divider(
                      color: AppTheme.grey,
                    ),
                    const OrderBody(text: "Chargeable Weight", value: "3Kg"),
                    OrderBody(
                        text: "Total Item Value",
                        value: AppTheme.money(466555.5)),
                    const OrderBody(text: "VAT (Fixed) ", value: "75%"),
                    const Divider(
                      color: AppTheme.grey,
                    ),
                    OrderBody(
                        text: "Shipping costs ",
                        value: AppTheme.money(459876.5)),
                    OrderBody(
                        text: "Insurance costs ",
                        value: AppTheme.money(11318.5)),
                    OrderBody(
                        text: "Additional tax costs ",
                        value: AppTheme.money(76.5)),
                    OrderBody(
                        text: "Inclusive costs",
                        value: AppTheme.money(459876.5)),
                    OrderBody(
                        text: "Total costs ", value: AppTheme.money(459876.5)),
                  ],
                )),
                SizedBox(
                  height: MySize.size20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OrderBody extends StatelessWidget {
  final String text;
  final String value;

  const OrderBody({
    super.key,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Text(value),
        ],
      ),
    );
  }
}

class miniHeader extends StatelessWidget {
  final String text;

  const miniHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(text), const Icon(Iconsax.arrow_right_3)],
      ),
    );
  }
}

class RowHeader extends StatelessWidget {
  final String text;

  const RowHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(text), const Icon(Iconsax.arrow_right_3)],
      ),
    );
  }
}
