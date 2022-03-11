import 'package:flutter/material.dart';
import 'package:flutter_developer_test/src/export/app_export.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            // _BuildBackground(),
            SingleChildScrollView(
              child: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [_BuildCard()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildCard extends StatelessWidget {
  const _BuildCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final titleSize = context.isPhone ? 12.sp : 8.sp;

    return TweenAnimationWidget<double>(
      type: TweenAnimationType.scale,
      tween: Tween(begin: .5, end: 1.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BaseTextWidget(
                text: 'Iniciar sesion',
                textStyle: context.headlineSmall,
              ),

              // const _BuildForms(),
              // const _BuildButton(),
            ],
          ),
        ),
      ),
    );
  }
}
/*
class _BuildIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final iconSize = context.isPhone ? 70.sp : 60.sp;

    return Positioned(
      top: 15.w,
      child: SizedBox(
        width: 100.w,
        child: Icon(
          Icons.person_pin,
          size: iconSize,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}

class _BuildBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return TweenAnimationWidget<Offset>(
      type: TweenAnimationType.translate,
      tween: Tween(begin: Offset(0, -50.w), end: const Offset(0, 0)),
      child: Container(
        width: 100.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.elliptical(250.0, 150.0),
          ),
          gradient: MyGradiants.linearType1(
            color1: theme.primary,
            color2: theme.primaryVariant,
          ),
        ),
        child: Stack(
          children: [
            Positioned(child: _circle(context), top: 90, left: 30),
            Positioned(child: _circle(context), top: -40, left: -30),
            Positioned(child: _circle(context), top: -50, right: -20),
            Positioned(child: _circle(context), bottom: 120, right: 20),
          ],
        ),
      ),
    );
  }

  Widget _circle(BuildContext context) {
    return Container(
      width: 25.w,
      height: 25.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primaryVariant.withAlpha(127),
      ),
    );
  }
}

class _BuildForms extends StatelessWidget {
  const _BuildForms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController ctrl = Get.find();
    final theme = Theme.of(context).colorScheme;
    final iconSize = context.isPhone ? 18.sp : 10.sp;

    return Column(
      children: [
        Form(
          key: ctrl.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              FormWidget(
                type: FormWidgetType.email,
                controller: ctrl.emailCtrl,
              ),
              SizedBox(height: 2.5.h),
              GetX<LoginController>(
                builder: (_) => FormWidget(
                  type: FormWidgetType.password,
                  controller: _.passwordCtrl,
                  obscureText: _.obscureText,
                  suffixIcon: InkWell(
                    onTap: _.onTapVisibilityPassword,
                    child: Icon(
                      _.obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: theme.primary,
                      size: iconSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _BuildButton extends StatelessWidget {
  const _BuildButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController ctrl = Get.find();
    final theme = Theme.of(context).colorScheme;
    final textSize = context.isPhone ? 12.sp : 8.sp;

    return Card(
      color: theme.primary,
      elevation: 6,
      shape: const StadiumBorder(),
      child: Obx(() => InkWell(
            onTap: ctrl.isLoading ? null : () => ctrl.onTapLogin(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastLinearToSlowEaseIn,
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: ctrl.isLoading ? 10.0 : 15.w,
              ),
              child: ctrl.isLoading
                  ? SizedBox(
                      width: 5.w,
                      height: 5.w,
                      child: CircularProgressIndicator(color: theme.onPrimary),
                    )
                  : Text(
                      'Entrar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: textSize,
                        color: theme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          )),
    );
  }
}
*/