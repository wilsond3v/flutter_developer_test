import 'package:flutter_developer_test/src/export/app_export.dart';

abstract class AppPages {
  static List<GetPage> pages = [
    GetPage(name: AppRoutes.initial, page: () => const SplashPage()),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
  ];
}
