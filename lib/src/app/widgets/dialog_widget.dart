import 'package:flutter/material.dart';

enum DialogWidetType { fullScreen, basic }

class DialogWidget {
  /// dialogo de uso general
  static Future<void> show({
    required BuildContext context,
    DialogWidetType type = DialogWidetType.basic,
    final String title = 'Titulo breve',
    final String titleSave = 'Aceptar',
    final String titleClose = 'Cancelar',
    final void Function()? save,
    final void Function()? close,
    required final Widget child,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        switch (type) {
          case DialogWidetType.fullScreen:
            return _BuildFullScreen(
              title: title,
              titleSave: titleSave,
              close: close ?? () => Navigator.of(context).pop(),
              save: save ?? () {},
              child: child,
            );
          default:
            return _BuildBasic(
              title: title,
              titleSave: titleSave,
              titleClose: titleClose,
              close: close ?? () => Navigator.of(context).pop(),
              save: save,
              child: child,
            );
        }
      },
    );
  }
}

class _BuildFullScreen extends StatelessWidget {
  const _BuildFullScreen({
    Key? key,
    required this.title,
    required this.titleSave,
    this.save,
    this.close,
    required this.child,
  }) : super(key: key);

  final String title;
  final String titleSave;
  final void Function()? save;
  final void Function()? close;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: theme.surface,
      appBar: AppBar(
        backgroundColor: theme.surface,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          tooltip: 'Cerrar dialogo',
          icon: const Icon(Icons.close),
          color: theme.onSurface,
          onPressed: close,
          splashRadius: 20,
        ),
        title: _BaseText(
          text: title,
          color: theme.onSurface,
          textStyle: textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: _BaseButton(title: titleSave, onTap: save),
          )
        ],
      ),
      body: Column(
        children: [
          Divider(
            indent: 25,
            endIndent: 25,
            color: theme.surfaceVariant,
            thickness: 2.0,
          ),
          Flexible(child: child),
        ],
      ),
    );
  }
}

class _BuildBasic extends StatelessWidget {
  const _BuildBasic({
    Key? key,
    required this.title,
    required this.titleSave,
    required this.titleClose,
    this.save,
    this.close,
    required this.child,
  }) : super(key: key);

  final String title;
  final String titleSave;
  final String titleClose;
  final void Function()? save;
  final void Function()? close;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      backgroundColor: theme.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
      titlePadding: const EdgeInsets.only(
        top: 24.0,
        bottom: 16.0,
        left: 24.0,
        right: 24.0,
      ),
      buttonPadding: const EdgeInsets.all(24.0),
      title: _BaseText(
        text: title,
        color: theme.onSurface,
        textStyle: textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(child: child),
      actions: [
        _BaseButton(title: titleClose, onTap: close),
        _BaseButton(title: titleSave, onTap: save),
      ],
    );
  }
}

/// Base para los texto usados en este archivo
class _BaseText extends StatelessWidget {
  const _BaseText({
    Key? key,
    required this.text,
    this.textStyle,
    this.color,
    this.fontWeight,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: textStyle?.copyWith(
            color: color,
            fontWeight: fontWeight,
          ) ??
          Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: color,
                fontWeight: fontWeight,
              ),
    );
  }
}

class _BaseButton extends StatelessWidget {
  const _BaseButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: _BaseText(
        text: title,
        textStyle: Theme.of(context).textTheme.labelLarge,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
