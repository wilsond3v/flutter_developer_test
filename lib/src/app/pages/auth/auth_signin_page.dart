import 'package:flutter/material.dart';
import 'package:flutter_developer_test/src/export/app_export.dart';

class AuthSigninPage extends StatelessWidget {
  const AuthSigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseTextWidget(
              text: 'Nueva cuenta',
              textStyle: context.headlineSmall,
              fontWeight: FontWeight.bold,
            ),
            const _BuildForms(),
            Row(
              children: [
                IconButton(
                  onPressed: authCtrl.goToBack,
                  splashRadius: 20,
                  icon: Icon(
                    Icons.arrow_back,
                    color: context.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _BuildButton(
                    title: 'Crear cuenta',
                    color: context.colorScheme.primary,
                    textColor: context.colorScheme.onPrimary,
                    onTap: authCtrl.isLoading ? null : authCtrl.onTapSignIn,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildForms extends StatelessWidget {
  const _BuildForms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Form(
        key: authCtrl.formKeyAuthSignin,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            FormWidget(
              type: FormWidgetType.email,
              controller: authCtrl.emailCtrl,
            ),
            const SizedBox(height: 16),
            Obx(() {
              return FormWidget(
                type: FormWidgetType.password,
                controller: authCtrl.passwordCtrl,
                obscureText: authCtrl.obscureText,
                suffixIcon: InkWell(
                  onTap: authCtrl.onTapVisibilityPassword,
                  child: Icon(
                    authCtrl.obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
            Obx(() {
              return FormWidget(
                keyboardType: TextInputType.visiblePassword,
                controller: authCtrl.passwordVeriCtrl,
                obscureText: authCtrl.obscureText,
                prefixIcon: const Icon(Icons.password),
                labelText: 'Verificar contraseña',
                hintText: '****',
                validator: (str) {
                  if (str != null) {
                    if (str.length < 6) {
                      return 'Minimo 6 caracteres';
                    } else if (str != authCtrl.passwordCtrl.text) {
                      return 'La contraseña es diferente';
                    } else {
                      return null;
                    }
                  }
                },
                suffixIcon: InkWell(
                  onTap: authCtrl.onTapVisibilityPassword,
                  child: Icon(
                    authCtrl.obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _BuildButton extends StatelessWidget {
  const _BuildButton({
    Key? key,
    required this.title,
    required this.color,
    required this.textColor,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Color color;
  final Color textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      elevation: 0,
      highlightElevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      color: color,
      disabledColor: context.colorScheme.surfaceVariant,
      child: BaseTextWidget(
        text: title,
        textAlign: TextAlign.center,
        color: textColor,
        textStyle: context.labelLarge,
      ),
    );
  }
}
