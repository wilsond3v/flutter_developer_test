import 'package:flutter/material.dart';
import 'package:flutter_developer_test/src/export/app_export.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late FirebaseAuth _auth;
  late TextEditingController emailCtrl;
  late TextEditingController passwordCtrl;
  late TextEditingController passwordVeriCtrl;
  late GlobalKey<FormState> formKeyAuthLogin;
  late GlobalKey<FormState> formKeyAuthSignin;
  final navId = 0;
  final _isLoading = false.obs;
  final _obscureText = true.obs;
  var flexValue = 2.obs;

  @override
  void onInit() {
    _auth = FirebaseAuth.instance;
    formKeyAuthLogin = GlobalKey<FormState>();
    formKeyAuthSignin = GlobalKey<FormState>();
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    passwordVeriCtrl = TextEditingController();

    super.onInit();
  }

  /// Gets & Sets
  bool get isLoading => _isLoading.value;
  bool get obscureText => _obscureText.value;

  // Metodos

  /// rutas anidadas para navegar entre login y signin
  Route<dynamic>? authGenerateRoutes(RouteSettings route) {
    switch (route.name) {
      case AppRoutes.authSignin:
        return GetPageRoute(
          routeName: route.name,
          settings: route,
          transition: Transition.zoom,
          page: () => const AuthSigninPage(),
        );
      default:
        return GetPageRoute(
          routeName: route.name,
          settings: route,
          page: () => const AuthLoginPage(),
        );
    }
  }

  Future<void> onTapLogin() async {
    Get.focusScope?.unfocus();
    if (!_isValidFormLogin()) return;
    final loginOk = await _login(
      email: emailCtrl.text.trim().toLowerCase(),
      password: passwordCtrl.text,
    );
    if (loginOk) {
      emailCtrl.clear();
      passwordCtrl.clear();
      passwordVeriCtrl.clear();
      return Get.offAllNamed(AppRoutes.home);
    }
  }

  /// Iniciar sesion
  Future<bool> _login({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _isLoading.value = false;
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Hola, usuario',
          '',
          dismissDirection: DismissDirection.horizontal,
          messageText: const BaseTextWidget(
            text: 'El correo no ah sido encontrado',
            overflow: TextOverflow.visible,
          ),
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Hola, usuario',
          '',
          dismissDirection: DismissDirection.horizontal,
          messageText: const BaseTextWidget(
            text: 'La contraseña es incorrecta',
            overflow: TextOverflow.visible,
          ),
        );
      }
      _isLoading.value = false;
      return false;
    }
  }

  Future<void> onTapSignIn() async {
    Get.focusScope?.unfocus();
    if (!_isValidFormSignin()) return;
    final signInOk = await _signIn(
      email: emailCtrl.text.trim().toLowerCase(),
      password: passwordCtrl.text,
    );
    if (signInOk) {
      emailCtrl.clear();
      passwordCtrl.clear();
      passwordVeriCtrl.clear();
      return Get.offAllNamed(AppRoutes.home);
    }
  }

  /// Registrarse
  Future<bool> _signIn({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ); // .then((value) => value.user?.updateDisplayName(name));
      _isLoading.value = false;
      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          Get.snackbar(
            'Hola, usuario',
            '',
            dismissDirection: DismissDirection.horizontal,
            messageText: const BaseTextWidget(
              text: 'Este correo ya existe.',
              overflow: TextOverflow.visible,
            ),
          );
          break;
        case 'invalid-email':
          Get.snackbar(
            'Hola, usuario',
            '',
            dismissDirection: DismissDirection.horizontal,
            messageText: const BaseTextWidget(
              text: 'La dirección de correo electrónico no es válida.',
              overflow: TextOverflow.visible,
            ),
          );
          break;
        // case 'operation-not-allowed':
        //   SnackBarWidget.show(
        //     context: context,
        //     title: 'Hola, usuario',
        //     message: 'las cuentas de correo electrónico/contraseña no están habilitadas.',
        //   );
        //   break;
        case 'weak-password':
          Get.snackbar(
            'Hola, usuario',
            '',
            dismissDirection: DismissDirection.horizontal,
            messageText: const BaseTextWidget(
              text: 'La contraseña no es lo suficientemente segura.',
              overflow: TextOverflow.visible,
            ),
          );
          break;
        default:
          Get.snackbar(
            'Hola, usuario',
            '',
            dismissDirection: DismissDirection.horizontal,
            messageText: const BaseTextWidget(
              text: 'Ah ocurrido un error, verifica tus datos.',
              overflow: TextOverflow.visible,
            ),
          );
      }
      _isLoading.value = false;
      return false;
    }
  }

  // confirma el estado de validacion en el form
  bool _isValidFormLogin() {
    return formKeyAuthLogin.currentState?.validate() ?? false;
  }

  bool _isValidFormSignin() {
    return formKeyAuthSignin.currentState?.validate() ?? false;
  }

  /// cambia la visibilidad del texto del password
  void onTapVisibilityPassword() => _obscureText.value = !_obscureText.value;

  /// ir a atras
  Future<void> goToBack() async {
    emailCtrl.clear();
    passwordCtrl.clear();
    _obscureText.value = true;
    flexValue.value = 2;
    return Get.back(id: navId);
  }

  /// ir al card para crear cuentas
  Future<void> goToSignPage() async {
    emailCtrl.clear();
    passwordCtrl.clear();
    _obscureText.value = true;
    flexValue.value = 3;
    return Get.toNamed(AppRoutes.authSignin, id: navId);
  }
}
