import 'package:flutter/material.dart';

enum FormWidgetType { base, email, password, textArea }

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    this.type = FormWidgetType.base,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.labelText = "label",
    this.hintText = "hint",
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus = false,
    this.readOnly = false,
    this.obscureText = false,
    this.showFilled = false,
    this.onChanged,
    this.validator,
    this.onTap,
    this.onFieldSubmitted,
  }) : super(key: key);

  final FormWidgetType type;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String labelText;
  final String hintText;
  final bool autofocus;
  final bool readOnly;
  final bool obscureText;
  final bool showFilled;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String?)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case FormWidgetType.textArea:
        return _BaseForm(
          controller: controller,
          keyboardType: keyboardType,
          icon: icon,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText,
          hintText: hintText,
          obscureText: obscureText,
          maxLines: 8,
          maxLength: 1000,
          borderRadius: 16.0,
          showFilled: showFilled,
          alignLabelWithHint: true,
          textAlign: TextAlign.start,
          constraints: null,
          autofocus: autofocus,
          readOnly: readOnly,
          onChanged: onChanged,
          validator: validator,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
        );
      case FormWidgetType.email:
        return _BaseForm(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          icon: icon,
          prefixIcon: const Icon(Icons.alternate_email_rounded),
          suffixIcon: suffixIcon,
          labelText: 'Correo',
          hintText: 'ejemplo@ejemplo.com',
          obscureText: obscureText,
          maxLines: 1,
          maxLength: null,
          borderRadius: 16.0,
          showFilled: showFilled,
          alignLabelWithHint: false,
          textAlign: TextAlign.start,
          constraints: null,
          autofocus: autofocus,
          readOnly: readOnly,
          onChanged: onChanged,
          validator: (value) {
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regExp = RegExp(pattern);

            return regExp.hasMatch(value ?? '')
                ? null
                : 'Escribe un correo valido';
          },
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
        );
      case FormWidgetType.password:
        return _BaseForm(
          controller: controller,
          keyboardType: TextInputType.visiblePassword,
          icon: icon,
          prefixIcon: const Icon(Icons.password_outlined),
          suffixIcon: suffixIcon,
          labelText: 'Contraseña',
          hintText: '****',
          obscureText: obscureText,
          maxLines: 1,
          maxLength: null,
          borderRadius: 16.0,
          showFilled: showFilled,
          alignLabelWithHint: false,
          textAlign: TextAlign.start,
          constraints: null,
          autofocus: autofocus,
          readOnly: readOnly,
          onChanged: onChanged,
          validator: (value) {
            return (value != null && value.length >= 6)
                ? null
                : 'Minimo 6 caracteres';
          },
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
        );
      default:
        return _BaseForm(
          controller: controller,
          keyboardType: keyboardType,
          icon: icon,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText,
          hintText: hintText,
          obscureText: obscureText,
          maxLines: 1,
          maxLength: null,
          borderRadius: 16.0,
          showFilled: showFilled,
          alignLabelWithHint: false,
          textAlign: TextAlign.start,
          constraints: null,
          autofocus: autofocus,
          readOnly: readOnly,
          onChanged: onChanged,
          validator: validator,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
        );
    }
  }
}

class _BaseForm extends StatelessWidget {
  const _BaseForm({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.icon,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.maxLines,
    required this.maxLength,
    required this.borderRadius,
    required this.showFilled,
    required this.alignLabelWithHint,
    required this.textAlign,
    required this.constraints,
    required this.autofocus,
    required this.readOnly,
    required this.onChanged,
    required this.validator,
    required this.onTap,
    required this.onFieldSubmitted,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final int maxLines;
  final int? maxLength;
  final double borderRadius;
  final bool showFilled;
  final bool alignLabelWithHint;
  final TextAlign textAlign;
  final BoxConstraints? constraints;
  final bool autofocus;
  final bool readOnly;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String?)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      textAlign: textAlign,
      // textAlignVertical: TextAlignVertical.bottom,
      autocorrect: false,
      readOnly: readOnly,
      enabled: !readOnly,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      autofocus: autofocus,
      maxLength: maxLength,
      style: textTheme.labelLarge?.copyWith(color: theme.onSecondaryContainer),
      decoration: InputDecoration(
        alignLabelWithHint: alignLabelWithHint,
        hintText: hintText,
        labelText: labelText,
        fillColor: theme.secondaryContainer,
        filled: showFilled,
        icon: icon,
        constraints: constraints,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        // prefixIconConstraints: BoxConstraints(minWidth: 12.w),
        // suffixIconConstraints: BoxConstraints(minWidth: 12.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: theme.secondaryContainer,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: theme.secondaryContainer,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: theme.primary,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: theme.errorContainer,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: theme.errorContainer,
            width: 2.0,
          ),
        ),
      ),
      onChanged: onChanged,
      validator: validator,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
