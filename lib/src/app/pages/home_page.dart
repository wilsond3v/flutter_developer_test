import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_developer_test/src/export/app_export.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: NestedScrollView(
            headerSliverBuilder: (_, __) => [
              const _BuildTitle(),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              TabSliverWidget(
                tabCtrl: homeCtrl.tabCtrl,
                maxExt: context.isPhone ? 12.w : 9.w,
                minExt: context.isPhone ? 12.w : 9.w,
                tabs: List.from(homeCtrl.tabs.map((item) => Tab(text: item))),
              ),
            ],
            body: TabBarView(
              controller: homeCtrl.tabCtrl,
              children: const [_BuildBodyCase2(), _BuildBodyCase3y4()],
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildTitle extends StatelessWidget {
  const _BuildTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          height: 57,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TweenAnimationWidget<Offset>(
                type: TweenAnimationType.translate,
                tween: Tween(
                  begin: const Offset(-100, 0),
                  end: const Offset(0, 0),
                ),
                child: BaseTextWidget(
                  text: 'Bienvenido',
                  textStyle: context.headlineSmall,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TweenAnimationWidget<Offset>(
                type: TweenAnimationType.translate,
                tween: Tween(
                  begin: const Offset(100, 0),
                  end: const Offset(0, 0),
                ),
                child: IconButton(
                  splashRadius: 20,
                  onPressed: homeCtrl.onTapLogout,
                  icon: const Icon(Icons.logout),
                ),
              )
            ],
          )),
    );
  }
}

class _BuildBodyCase2 extends StatelessWidget {
  const _BuildBodyCase2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _BaseButton(
            title: 'Tomar una foto',
            onTap: homeCtrl.onTapCapturePhoto,
          ),
          const SizedBox(height: 16),
          GetBuilder<HomeController>(
            id: AppUpdateId.homeCapturePhoto,
            builder: (ctrl) => ctrl.photo != null
                ? Obx(() => ctrl.loadData.value
                    ? const Center(child: CircularProgressIndicator())
                    : _BuildPhoto(image: ctrl.photo!))
                : const BaseTextWidget(text: 'No se tomó ninguna imagen'),
          ),
        ],
      ),
    );
  }
}

class _BuildBodyCase3y4 extends StatelessWidget {
  const _BuildBodyCase3y4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: homeCtrl.posts.length,
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      itemBuilder: (_, i) => Card(
        margin: const EdgeInsets.all(8.0),
        color: context.colorScheme.secondaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        child: ListTile(
          onTap: () => homeCtrl.goToDetailPage(homeCtrl.posts[i]),
          title: RichText(
            text: TextSpan(
              text: 'Titulo: ',
              style: context.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSecondaryContainer,
              ),
              children: [
                TextSpan(
                  text: homeCtrl.posts[i].title.toUpperCase(),
                  style: context.labelLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: context.colorScheme.onSecondaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildPhoto extends StatelessWidget {
  const _BuildPhoto({Key? key, required this.image}) : super(key: key);
  final File image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Image.file(image),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _BaseButton(
                title: 'Guardar foto',
                outlinedButton: true,
                onTap: () => homeCtrl.onTapSavePhoto(image),
              ),
              _BaseButton(
                outlinedButton: true,
                title: 'Descartar foto',
                onTap: () => homeCtrl.onTapDeletePhoto(image),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BaseButton extends StatelessWidget {
  const _BaseButton({
    Key? key,
    required this.title,
    this.onTap,
    this.outlinedButton = false,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;
  final bool outlinedButton;

  @override
  Widget build(BuildContext context) {
    return outlinedButton
        ? OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: context.colorScheme.primary,
                width: 2,
              ),
              shape: const StadiumBorder(),
            ),
            child: BaseTextWidget(
              text: title,
              textStyle: context.titleMedium,
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          )
        : MaterialButton(
            color: context.colorScheme.secondaryContainer,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            onPressed: onTap,
            highlightElevation: 3,
            child: BaseTextWidget(
              text: title,
              textStyle: context.titleMedium,
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          );
  }
}
