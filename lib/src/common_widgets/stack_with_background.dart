import 'package:flutter/material.dart';
import 'package:nekosama/src/common_widgets/background.dart';

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
        const BackGround(),
        SafeArea(
          child: child,
        ),
      ],
    );
  }
}
