import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ship_to_naija/constants/notification_list.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/page_layout.dart';
import 'package:ship_to_naija/models/notificationData.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

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
              padding: EdgeInsets.only(left: MySize.size20),
              child: FadeInLeft(
                delay: const Duration(milliseconds: 20),
                child: Text(
                  'Notifications',
                  style: AppTheme.formHeaderStyle(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            PageLayout(
              horizontalMargin: 15,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: notificationList.length,
                itemBuilder: (BuildContext context, int index) {
                  NotificationData notData = notificationList[index];
                  return NotificationTile(notData: notData);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.notData,
  });

  final NotificationData notData;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              notData.isView ? Colors.transparent : AppTheme.grey.withOpacity(.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.local_shipping_outlined,
                color: Colors.green,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      notData.remark,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          notData.date,
                          style:
                              const TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 8),

              Icon(
                Icons.circle,
                size: MySize.size15,
                color: notData.isView ? Colors.transparent : Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
