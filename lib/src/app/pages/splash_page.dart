import 'package:flutter/material.dart';
import 'package:flutter_developer_test/src/export/app_export.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(children: const [_BuildLogo(), _BuildProgress()]),
          ),
        ),
      ),
    );
  }
}

class _BuildLogo extends StatelessWidget {
  const _BuildLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 35.w,
      right: 35.w,
      bottom: 35.h,
      top: 35.h,
      child: TweenAnimationWidget<double>(
        tween: Tween(begin: .2, end: 1.0),
        type: TweenAnimationType.scale,
        child: Image.asset(AppImage.logo, fit: BoxFit.contain),
      ),
    );
  }
}

class _BuildProgress extends StatelessWidget {
  const _BuildProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: TweenAnimationWidget<Offset>(
        tween: Tween(
          begin: const Offset(-15, 100),
          end: const Offset(-15, -15),
        ),
        type: TweenAnimationType.translate,
        child: SizedBox(
          width: 12.w,
          height: 12.w,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
