import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/styles.dart';
import '../../core/model/notification_model.dart';

class NotificationsScreen extends StatelessWidget {

   NotificationsScreen({super.key});
  final List<NotificationModel> notificationsList = [
    NotificationModel(
      title: "إشعار جديد",
      message: "تم استلام الطالب أحمد خالد بنجاح.",
      time: "قبل 5 دقائق",
    ),
    NotificationModel(
      title: "تنبيه",
      message: "لم يتم استلام الطالبة سارة أحمد حتى الآن.",
      time: "قبل 10 دقائق",
    ),
    NotificationModel(
      title: "إشعار جديد",
      message: "تم تسجيل دخول ولي أمر الطالب يوسف إبراهيم.",
      time: "قبل 30 دقيقة",
    ),
    NotificationModel(
      title: "تنبيه",
      message: "موعد استلام الطالبة مها عبد الله يقترب.",
      time: "قبل ساعة",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 15,)),

        title: Text("الإشعارات",style: robotoMedium.copyWith(
            color: Colors.white,
            fontSize: 18
        ),),
        backgroundColor: Colors.teal,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        itemCount: notificationsList.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          var notification = notificationsList[index];
          return ListTile(
            title: Text(
              notification.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: notification.isRead ? Colors.grey : Colors.black,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.message),
                SizedBox(height: 5),
                Text(
                  notification.time,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            leading: Icon(
              notification.isRead
                  ? Icons.notifications_none
                  : Icons.notifications_active,
              color: notification.isRead ? Colors.grey : Colors.teal,
            ),
            onTap: () {
              notification.isRead = true;
              Get.snackbar("الإشعار", "تم فتح الإشعار: ${notification.title}",
                  snackPosition: SnackPosition.BOTTOM);
            },
          );
        },
      ),
    );
  }
}