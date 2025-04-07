import 'package:school_smart/core/constants/images.dart';

class SchoolModel {
  String studentName;
  String parentName;
  String notificationTime;
  bool isReceived; // true = تم الاستلام, false = لم يتم الاستلام بعد
  String schoolName;
  String image;

  SchoolModel({
    required this.studentName,
    required this.parentName,
    required this.notificationTime,
    required this.isReceived,
    required this.schoolName,
    required this.image,
  });
}

List<SchoolModel> schoolList = [
  SchoolModel(
    studentName: 'Ahmed Khaled',
    parentName: 'Khaled Mohamed',
    notificationTime: '08:30 AM',
    isReceived: true,
    schoolName: 'الكعبان المشتركة للبنات',
    image: Images.school1,
  ),
  SchoolModel(
    studentName: 'Sara Ahmed',
    parentName: 'Ahmed Ali',
    notificationTime: '08:45 AM',
    isReceived: false,
    schoolName: 'الخور الثانوية للبنات',
    image: Images.school7,
  ),
  SchoolModel(
    studentName: 'Youssef Ibrahim',
    parentName: 'Ibrahim Hassan',
    notificationTime: '09:00 AM',
    isReceived: true,
    schoolName: 'الكعبان المشتركة للبنين',
    image: Images.school3,
  ),
  SchoolModel(
    studentName: 'Maha Abdullah',
    parentName: 'Abdullah Youssef',
    notificationTime: '09:15 AM',
    isReceived: false,
    schoolName: 'الخور الابتدائية للبنين',
    image: Images.school8,
  ),
  SchoolModel(
    studentName: 'Khaled Sami',
    parentName: 'Sami Hassan',
    notificationTime: '09:30 AM',
    isReceived: true,
    schoolName: 'مدرسة الغويرية المشتركة للبنات',
    image: Images.school5,
  ),
  SchoolModel(
    studentName: 'Layan Mohamed',
    parentName: 'Mohamed Fouad',
    notificationTime: '09:45 AM',
    isReceived: false,
    schoolName: 'مدرسة جاسم الثانوية للبنين',
    image: Images.school9,
  ),
  SchoolModel(
    studentName: 'Rakan Nasser',
    parentName: 'Nasser Abdulaziz',
    notificationTime: '10:00 AM',
    isReceived: true,
    schoolName: 'الكعبان المشتركة للبنات',
    image: Images.school2,
  ),
  SchoolModel(
    studentName: 'Fatima Youssef',
    parentName: 'Youssef Abdulkarim',
    notificationTime: '10:15 AM',
    isReceived: false,
    schoolName: 'الخور الثانوية للبنات',
    image: Images.school10,
  ),
  SchoolModel(
    studentName: 'Omar Mahmoud',
    parentName: 'Mahmoud Salem',
    notificationTime: '10:30 AM',
    isReceived: true,
    schoolName: 'الكعبان المشتركة للبنين',
    image: Images.school4,
  ),
  SchoolModel(
    studentName: 'Mohamed Khaled',
    parentName: 'Khaled Abdullah',
    notificationTime: '10:45 AM',
    isReceived: false,
    schoolName: 'مدرسة الغويرية المشتركة للبنات',
    image: Images.school6,
  ),
];

class SchoolChildrenModel {
  String title;
  String image;

  SchoolChildrenModel({
    required this.title,
    required this.image,
  });
}

List<SchoolChildrenModel> schoolChildrenList = [
  SchoolChildrenModel(title: 'الكعبان المشتركة للبنات', image: Images.school1),
  SchoolChildrenModel(title: 'الخور الثانوية للبنات', image: Images.school2),
  SchoolChildrenModel(title: 'الكعبان المشتركة للبنين', image: Images.school3),
  SchoolChildrenModel(title: 'الخور الابتدائية للبنين', image: Images.school4),
  SchoolChildrenModel(title: 'مدرسة الغويرية المشتركة للبنات', image: Images.school5),
  SchoolChildrenModel(title: 'مدرسة جاسم الثانوية للبنين', image: Images.school6),
];