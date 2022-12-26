import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/ui/pages/top/components/top_page_body.dart';

class CatButton extends ConsumerWidget {
  const CatButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onTapDown(TapDownDetails detail) {
      ref.watch(boolProvider.notifier).update((state) => state = true);
    }

    void onTapUp(TapDownDetails detail) {
      ref.watch(boolProvider.notifier).update((state) => state = false);
      context.push('/signIn');
    }

    void onTapCancel() {
      ref.watch(boolProvider.notifier).update((state) => state = false);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: ref.watch(boolProvider) ? 8.0 : 0.0,
              ),
              child: GestureDetector(
                onTapDown: onTapDown,
                onTapUp: (value) {
                  ref
                      .watch(boolProvider.notifier)
                      .update((state) => state = false);
                  context.push('/signIn');
                },
                onTapCancel: onTapCancel,
                child: Center(
                  child: CustomPaint(
                    size: const Size(300, 100),
                    painter: CirclePainter(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ref.watch(boolProvider) ? 32.0 : 24.0,
              ),
              child: GestureDetector(
                onTapDown: onTapDown,
                onTapUp: (value) {
                  ref
                      .watch(boolProvider.notifier)
                      .update((state) => state = false);
                  context.push('/signIn');
                },
                onTapCancel: onTapCancel,
                child: const Text(
                  '登録する？',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CirclePainter extends CustomPainter {
  static const buttonColor = Color(0xff434243);
  static const height = 0.3;
  static const leftWidth = 0.35;
  static const rightWidth = 0.65;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = buttonColor;

    final rect = RRect.fromLTRBR(
      size.width * 0.2,
      size.height * height,
      size.width * 0.8,
      size.height,
      const Radius.circular(30),
    );

    canvas.drawRRect(rect, paint);

    // 三角（左）
    paint.color = buttonColor;
    final pathLeft = Path()
      ..moveTo(size.width * leftWidth, 10)
      ..lineTo(size.width * leftWidth - 15, size.height * height + 1)
      ..lineTo(size.width * leftWidth + 15, size.height * height + 1)
      ..close();

    canvas.drawPath(pathLeft, paint);

    // 三角（右）
    paint.color = const Color(0xff434243);
    final pathRight = Path()
      ..moveTo(size.width * rightWidth, 10)
      ..lineTo(size.width * rightWidth - 15, size.height * height + 1)
      ..lineTo(size.width * rightWidth + 15, size.height * height + 1)
      ..close();

    canvas.drawPath(pathRight, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
