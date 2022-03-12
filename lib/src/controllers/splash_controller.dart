import 'package:flutter_developer_test/src/export/app_export.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();

  @override
  void onReady() async {
    await 2.delay();
    Get.offNamed(AppRoutes.auth);
    super.onReady();
  }
}
