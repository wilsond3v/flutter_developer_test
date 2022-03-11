import 'package:flutter/material.dart';

// const _sm = 576;
const _md = 600;
// const _lg = 992;
// const _xl = 1200;
// const _xxl = 1400;

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget? desktop;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < _md;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= _md;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // Extra small devices (phones, 576px and down)
      // if (constraints.maxWidth < _sm) return mobile;

      // Large devices (desktops, 992px and up)
      if (constraints.maxWidth >= _md && desktop != null) return desktop!;

      // Medium devices (tablets, 600px and up)
      // if (constraints.maxWidth >= _md && tablet != null) return tablet!;

      return mobile;
    });
  }
}
