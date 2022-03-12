import 'package:flutter/material.dart';
import 'package:flutter_developer_test/src/export/app_export.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: const [_BuildBackground(), _BuildBody()],
          ),
        ),
      ),
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: Container()),
            Obx(() => Expanded(
                  flex: authCtrl.flexValue.value,
                  child: Navigator(
                    key: Get.nestedKey(authCtrl.navId),
                    onGenerateRoute: authCtrl.authGenerateRoutes,
                  ),
                )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}

class _BuildBackground extends StatelessWidget {
  const _BuildBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.elliptical(250.0, 150.0),
        ),
      ),
      child: Stack(
        children: const [
          _BaseCircle(end: 30, top: 150),
          _BaseCircle(end: -30, top: 20),
          _BaseCircle(end: -20, top: -20, left: false),
          _BaseCircle(end: 50, bottom: 50, left: false),
        ],
      ),
    );
  }
}

class _BaseCircle extends StatelessWidget {
  const _BaseCircle({
    Key? key,
    required this.end,
    this.top,
    this.bottom,
    this.left = true,
  }) : super(key: key);

  final double end;
  final double? top;
  final double? bottom;
  final bool left;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationWidget<double>(
        tween: Tween(begin: -100, end: end),
        child: Container(
          width: 25.w,
          height: 25.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.surface,
          ),
        ),
        builder: (_, value, child) {
          return left
              ? Positioned(
                  top: top,
                  bottom: bottom,
                  left: value,
                  child: child!,
                )
              : Positioned(
                  top: top,
                  bottom: bottom,
                  right: value,
                  child: child!,
                );
        });
  }
}
