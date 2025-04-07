import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:school_smart/core/widget/custom_button.dart';

import '../../../core/constants/styles.dart';

class NotificationsSettingsScreen extends StatefulWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  _NotificationsSettingsScreenState createState() => _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState extends State<NotificationsSettingsScreen> {
  bool soundEnabled = true;
  bool vibrationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 15,)),

        title: Text("Notifications Settings",style: robotoMedium.copyWith(color: Colors.white,fontSize: 20),),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("Enable sound notifications"),
              trailing: Switch(
                value: soundEnabled,
                onChanged: (value) {
                  setState(() {
                    soundEnabled = value;
                  });
                },
              ),
            ),
            Divider(color: Colors.grey[300],),
            ListTile(
              title: Text("Enable vibration for notifications",style: robotoMedium.copyWith(fontSize: 15),),
              trailing: Switch(
                value: vibrationEnabled,
                onChanged: (value) {
                  setState(() {
                    vibrationEnabled = value;
                  });
                },
              ),
            ),
            Divider(color: Colors.grey[300],),
            SizedBox(height: 20),
            CustomButton(
              radius: 5,
              width: MediaQuery.of(context).size.width / 2,
              buttonText: 'Save changes',onPressed: (){
              Get.back();

            },)
          ],
        ),
      ),
    );
  }
}
