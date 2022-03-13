import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_developer_test/src/export/app_export.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static HomeController instance = Get.find();
  late FirebaseAuth _auth;
  late PostProvider _postP;
  late TabController tabCtrl;
  final List<String> tabs = ['Caso 2', 'Caso 3 & 4'];
  late ImagePicker _picker;
  File? photo;
  var loadData = false.obs;
  List<PostModel> posts = [];

  @override
  void onInit() async {
    tabCtrl = TabController(length: tabs.length, vsync: this);
    _auth = FirebaseAuth.instance;
    _postP = PostProvider();
    _picker = ImagePicker();
    posts = await _postP.getPost();
    super.onInit();
  }

  // Metodos

  /// cerrar sesion
  Future<void> onTapLogout() async {
    await _auth.signOut();
    return Get.offAllNamed(AppRoutes.auth);
  }

  /// tomar una foto
  Future<void> onTapCapturePhoto() async {
    XFile? dataPhoto = await _picker.pickImage(source: ImageSource.camera);
    if (dataPhoto != null) {
      photo = File(dataPhoto.path);
      update([AppUpdateId.homeCapturePhoto]);
    }
  }

  /// guarda la foto en el dispositivo en android es AppData
  Future<void> onTapSavePhoto(File? image) async {
    if (image != null) {
      final dir = await getApplicationDocumentsDirectory();
      final savedImg = await image.copy('${dir.path}/image.png');
      photo = savedImg;
      loadData.value = true;
      await 1.delay();
      loadData.value = false;
      update([AppUpdateId.homeCapturePhoto]);
    }
  }

  void onTapDeletePhoto(File? image) {
    if (image != null) {
      photo = null;
      update([AppUpdateId.homeCapturePhoto]);
    }
  }

  void goToDetailPage(PostModel post) => Get.toNamed(
        AppRoutes.detail,
        arguments: post,
      );
}
