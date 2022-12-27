import 'package:flutter/material.dart';
import 'package:nekosama/ui/widgets/background.dart';

// デフォルトのバックグラウンドをStack
class StackWithBackground extends StatelessWidget {
  const StackWithBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const PrimaryBackground(),
        SafeArea(child: child),
      ],
    );
  }
}
