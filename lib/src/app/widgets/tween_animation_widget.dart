import 'package:flutter/material.dart';
import 'dart:math' as math;

enum TweenAnimationType { custom, scale, rotate, translate }

class TweenAnimationWidget<T> extends StatelessWidget {
  const TweenAnimationWidget({
    Key? key,
    this.type = TweenAnimationType.custom,
    this.duration = 500,
    this.delay = 0,
    this.curve = Curves.linear,
    required this.tween,
    this.builder,
    this.child,
  }) : super(key: key);

  final TweenAnimationType type;
  final int duration;
  final int delay;
  final Curve curve;
  final Tween<T> tween;
  final Widget Function(BuildContext, T, Widget?)? builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TweenAnimationType.scale:
        return _BaseFutureBuilder(
          delay: delay,
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: duration),
            curve: curve,
            tween: tween,
            child: child,
            builder: (_, T value, child) => Transform.scale(
              scale: value as double,
              child: child,
            ),
          ),
        );
      case TweenAnimationType.rotate:
        return _BaseFutureBuilder(
          delay: delay,
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: duration),
            curve: curve,
            tween: tween,
            child: child,
            builder: (_, dynamic value, child) => Transform.rotate(
              angle: math.pi / value,
              child: child,
            ),
          ),
        );
      case TweenAnimationType.translate:
        return _BaseFutureBuilder(
          delay: delay,
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: duration),
            curve: curve,
            tween: tween,
            child: child,
            builder: (_, T value, child) => Transform.translate(
              offset: value as Offset,
              child: child,
            ),
          ),
        );
      default:
        return _BaseFutureBuilder(
          delay: delay,
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: duration),
            curve: curve,
            tween: tween,
            child: child,
            builder: builder!,
          ),
        );
    }
  }
}

class _BaseFutureBuilder extends StatelessWidget {
  const _BaseFutureBuilder({
    Key? key,
    this.delay = 0,
    required this.child,
  }) : super(key: key);

  final int delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: delay)),
      builder: (_, data) {
        if (data.connectionState == ConnectionState.done) return child;
        return delay == 0 ? child : Container();
      },
    );
  }
}
