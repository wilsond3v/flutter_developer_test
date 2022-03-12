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
      name: AppRoutes.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => const DetailPage(),
      binding: DetailBinding(),
    ),
  ];
}
