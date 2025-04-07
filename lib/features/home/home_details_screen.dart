import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_smart/core/constants/images.dart';

import '../../core/constants/styles.dart';
import '../../core/model/school_model.dart';

class HomeDetailsScreen extends StatelessWidget {
  final SchoolModel student;

  HomeDetailsScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 15),
        ),
        title: Text(
          student.studentName,
          style: robotoMedium.copyWith(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  student.image,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildDetailRow("Student Name", student.studentName),
            _buildDetailRow("School", student.schoolName),
            _buildDetailRow("Parent Name", student.parentName),
            _buildDetailRow("Notification Time", student.notificationTime),
            _buildDetailRow(
              "Receiving Status",
              student.isReceived ? "Student has been received" : "Not received yet",
              color: student.isReceived ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: color ?? Colors.black),
          ),
        ],
      ),
    );
  }
}
