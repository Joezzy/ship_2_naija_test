import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/page_layout.dart';
import 'package:ship_to_naija/models/shippingData.dart';

class ShippingCard extends StatelessWidget {
  final ShippingData shipData;
  final VoidCallback? onTap;

  ShippingCard({
    this.onTap,
    Key? key,
    required this.shipData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      delay: const Duration(milliseconds: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MySize.screenWidth,
          height: MySize.size110,
          padding: EdgeInsets.all(MySize.size10),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(MySize.size10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shipment ID",
                      style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45)),
                  Text("Tracking Number",
                      style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(shipData.shippingId,
                      style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45)),
                  Text(shipData.trackingId,
                      style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shipping status",
                          style: TextStyle(
                              fontSize: MySize.size14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45)),
                      StatusWidget(status: shipData.shippingStatus),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Date Created".toString(),
                          style: TextStyle(
                              fontSize: MySize.size13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45)),
                      Text(shipData.dateCreated.toString(),
                          style: TextStyle(
                              fontSize: MySize.size13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45)),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 0.8,
                // height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    Key? key,
    required this.status,
  }) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: MySize.size10,
              width: MySize.size10,
              decoration: BoxDecoration(
                  color: status == "pending"
                      ? Colors.orange
                      : status == "delivered"
                          ? Colors.green
                          : Colors.redAccent,
                  borderRadius: BorderRadius.circular(20)),
            ),
            Positioned(
              top: 2,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  height: MySize.size5,
                  width: MySize.size5,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text(
              "${status == "payment_confirmed" ? "Confirmed" : status == "pay_later" ? "Pay later" : status == "credit" ? "Credit sale" : toBeginningOfSentenceCase(status)}",
              style: TextStyle(
                  color: status == "pending"
                      ? Colors.orange
                      : status == "delivered"
                          ? Colors.green
                          : Colors.redAccent,
                  fontSize: MySize.size12,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
