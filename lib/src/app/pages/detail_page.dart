import 'package:flutter/material.dart';
import 'package:flutter_developer_test/src/export/app_export.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postM = Get.arguments as PostModel;
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _BuildTitle(),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      BaseTextWidget(
                        text: 'Id Usuario',
                        textStyle: context.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BaseTextWidget(text: '${postM.userId}'),
                    ],
                  ),
                  Column(
                    children: [
                      BaseTextWidget(
                        text: 'Id',
                        textStyle: context.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BaseTextWidget(text: '${postM.id}'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _BaseText(title: 'Titulo: ', subtitle: postM.title),
            const SizedBox(height: 24),
            _BaseText(title: 'Descripcion: ', subtitle: postM.body),
          ],
        ),
      ),
    ));
  }
}

class _BuildTitle extends StatelessWidget {
  const _BuildTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                text: 'Detalles',
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
                onPressed: detailCtrl.goToBack,
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ],
        ));
  }
}

class _BaseText extends StatelessWidget {
  const _BaseText({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: title,
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.onSurface,
          ),
          children: [
            TextSpan(
              text: subtitle,
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeight.normal,
                color: context.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
