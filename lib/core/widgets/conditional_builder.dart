import 'package:flutter/material.dart';

class ConditionalBuilder extends StatelessWidget {
  const ConditionalBuilder({
    super.key,
    required this.fallback,
    required this.widget,
    required this.condition,
  });
  final Widget fallback;
  final Widget widget;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return condition ? widget : fallback;
  }
}
