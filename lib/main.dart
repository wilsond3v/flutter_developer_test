import 'package:flutter/material.dart';
import 'package:flutter_developer_test/src/export/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const colorTheme = Colors.orange;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (_) => AppLocalizations.of(_)!.appTitle,
      // THEME SECTION
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: colorTheme,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: colorTheme,
      ),
      // LANGUAGE SECTION
      // locale: ctrl.locale,
      fallbackLocale: const Locale('es', 'ES'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // ROUTES SECTION
      defaultTransition: Transition.fadeIn,
      initialRoute: AppRoutes.initial,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
