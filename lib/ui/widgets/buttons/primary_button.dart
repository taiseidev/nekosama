import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: CustomPaint(
          size: const Size(300, 100),
          painter: CirclePainter(),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xff434243);

    final rect = RRect.fromLTRBR(
      size.width * 0.2,
      size.height * 0.3,
      size.width * 0.8,
      size.height,
      const Radius.circular(30),
    );

    canvas.drawRRect(rect, paint);

    // 三角（左）
    paint.color = const Color(0xff434243);
    final pathLeft = Path()
      ..moveTo(size.width * 0.35, 10)
      ..lineTo(size.width * 0.35 - 15, size.height * 0.3 + 1)
      ..lineTo(size.width * 0.35 + 15, size.height * 0.3 + 1)
      ..close();

    canvas.drawPath(pathLeft, paint);

    // 三角（右）
    paint.color = const Color(0xff434243);
    final pathRight = Path()
      ..moveTo(size.width * 0.65, 10)
      ..lineTo(size.width * 0.65 - 15, size.height * 0.3 + 1)
      ..lineTo(size.width * 0.65 + 15, size.height * 0.3 + 1)
      ..close();

    canvas.drawPath(pathRight, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
