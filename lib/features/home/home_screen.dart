import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_smart/controller/home_controller.dart';
import 'package:school_smart/core/widget/custom_text_field.dart';

import '../../core/constants/images.dart';
import '../../core/constants/styles.dart';
import '../../core/model/school_model.dart';
import '../Notification/notification_screen.dart';
import 'home_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller){
      if (controller.filteredList == null) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  color: Colors.teal,
                ),
                height: 90.h,
                width: double.infinity,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      CircleAvatar(
                        radius: 25.r,
                        backgroundImage: AssetImage(Images.logo),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [
                          Text('yalla go',style: robotoMedium.copyWith(
                              color: Colors.white,
                              fontSize: 15
                          ),),
                          Text('version: 1.0',style: robotoMedium.copyWith(
                              color: Colors.white,
                              fontSize: 11
                          ),),
                        ],
                      ),
                      Spacer(),
                      IconButton(onPressed: (){
                        Get.to(NotificationsScreen());
                      }, icon: Icon(CupertinoIcons.bell,color: Colors.white,))
                    ],
                  ),
                ),),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: CustomTextField(
                  borderRadius: 5,
                  hintText: 'search',
                  controller: controller.searchController,
                  onChanged: (query) => controller.filterList(query),
                ),
              ),

              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var item = controller.filteredList[index];
                  return InkWell(
                    onTap: () {
                      Get.to(HomeDetailsScreen(student: item));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: ListTile(
                        title: Text(
                          item.studentName,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("School: ${item.schoolName}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            Text("Parent: ${item.parentName}", style: TextStyle(fontSize: 14)),
                            Text("Notification Time: ${item.notificationTime}",
                                style: TextStyle(fontSize: 12, color: Colors.grey)),
                            Text(
                              item.isReceived ? "Student received" : "Not received yet",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: item.isReceived ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(color: Colors.grey[300]);
                },
                itemCount: controller.filteredList.length,
              )
            ],
          ),
        ),
      );
    });
  }
}
