import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nekosama/src/utils/constants/string.dart';

// トップ画面のボタン
class CatButton extends HookWidget {
  const CatButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isPressed = useState(false);
    return Column(
      children: [
        Gap(isPressed.value ? 8.0 : 0.0),
        Padding(
          padding: EdgeInsets.only(bottom: isPressed.value ? 0.0 : 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTapDown: (value) {
                  isPressed.value = true;
                },
                onTapUp: (value) {
                  isPressed.value = false;
                  context.push('/phoneNumberInput');
                },
                onTapCancel: () {
                  isPressed.value = false;
                },
                child: CustomPaint(
                  size: const Size(300, 100),
                  painter: CatButtonPainter(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CatButtonPainter extends CustomPainter {
  static const buttonColor = Color(0xff434243);
  static const height = 0.3;
  static const leftWidth = 0.35;
  static const rightWidth = 0.65;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = buttonColor;

    // 土台
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

// テキスト描画用のペインター
    TextPainter(
      text: const TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
        children: <TextSpan>[TextSpan(text: catButtonText)],
      ),
      textDirection: TextDirection.ltr,
    )
      ..layout(maxWidth: size.width)
      ..paint(canvas, Offset(size.width / 3, size.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
