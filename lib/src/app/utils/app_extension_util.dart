import 'package:flutter/material.dart';
import 'package:flutter_developer_test/src/export/app_export.dart';

extension AppResponsiveExt on num {
  /// Eje: **20.h** -> es el **20%** de la altura(**height**) de la patanlla
  double get h => this * Get.height / 100;

  /// Eje: **20.w** -> es el **20%** del ancho(**width**) de la pantalla
  double get w => this * Get.width / 100;

  /// Calcula el sp (**Scalable Pixel**) según el tamaño de la pantalla del dispositivo
  ///
  /// Normalmente se usa para los textos
  /// ---
  double get sp => this * (Get.width / 3) / 100;
}

extension AppDeviceExt on BuildContext {
  /// es mobile?
  bool get isMobile => ResponsiveWidget.isMobile(this);

  /// es Escritorio?
  bool get isDesk => ResponsiveWidget.isDesktop(this);
}

extension AppThemeDataExt on BuildContext {
  /// acceso al colorScheme del tema de app
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Usado titulares grandes con mas enfasis, fonsize de 57
  ///
  /// https://m3.material.io/styles/typography/applying-scaling-type#:~:text=of%20use%20cases.-,Display,-There%20are%20three
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  /// Usado en titulares con menos enfasis, fonsize de 24
  ///
  /// https://m3.material.io/styles/typography/applying-scaling-type#:~:text=for%20display%20styles-,Headline,-Headline%20styles%20are
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  /// Usado en titulos, fonsize de 16
  ///
  /// https://m3.material.io/styles/typography/applying-scaling-type#:~:text=styles%20as%20well.-,Title,-Titles%20are%20smaller
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  /// Usado en textos que estan en botones,.., fonsize de 14
  ///
  /// https://m3.material.io/styles/typography/applying-scaling-type#:~:text=for%20title%20styles.-,Label,-Label%20styles%20are
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  /// Usado en parrafos, fonsize de 16
  ///
  /// https://m3.material.io/styles/typography/applying-scaling-type#:~:text=functionality%20in%20components-,Body,-Body%20styles%20are
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
}
