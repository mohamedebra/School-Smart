
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/auth_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/profile_controller.dart';
import '../../controller/set_controller.dart';
import '../api_client.dart';

class Mybinding extends Bindings {
  @override
  void dependencies() {
    Get.putAsync<SharedPreferences>(() async => await SharedPreferences.getInstance(), permanent: true);

    Get.lazyPut(() => ApiClient(sharedPreferences: Get.find()), fenix: true);
    Get.put(HomeController(), permanent: true);
    Get.put(UserProfileController(), permanent: true);

    Get.put(AuthController(), permanent: true);

  }
}
// class Mybinding extends Bindings {
//   @override
//   void dependencies() async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     Get.put(sharedPreferences, permanent: true);
//
//     Get.put(ApiClient(sharedPreferences: Get.find()), permanent: true);
//     Get.put(HomeController(), permanent: true);
//     Get.put(AuthController(), permanent: true);
//     Get.put(UserProfileController(), permanent: true);
//   }
// }
