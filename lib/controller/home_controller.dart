import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';


import '../core/PreferenceUtils.dart';
import '../core/model/school_model.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {


  TextEditingController searchController = TextEditingController();

  List<SchoolModel> filteredList = [];

  @override
  void onInit() {
    super.onInit();
    filteredList = List.from(schoolList);
  }

  void filterList(String query) {
    filteredList = schoolList
        .where((item) => item.studentName.contains(query))
        .toList();
    filteredList.sort((a, b) => a.studentName.compareTo(b.studentName));
    update();
  }
}
