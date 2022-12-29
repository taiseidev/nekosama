import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

enum ProcessType {
  complete(Color(0xff434243)),
  notComplete(Color(0xffd1d2d7));

  const ProcessType(this.color);
  final Color color;
}

class ProcessTimeline extends StatelessWidget {
  const ProcessTimeline({
    super.key,
    required this.activeIndex,
  });

  final int activeIndex;
  Color getColor(int index) {
    if (index <= activeIndex) {
      return ProcessType.complete.color;
    } else {
      return ProcessType.notComplete.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 80,
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: const ConnectorThemeData(
            space: 30,
            thickness: 5,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          // 各アイテムのサイズ
          itemExtentBuilder: (_, __) => 80,
          // 猫アイコンのbuilder
          contentsBuilder: (context, index) {
            return Visibility(
              visible: index == activeIndex,
              child: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Image(
                  image: AssetImage('assets/images/cat_walk.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          // 各丸のbuilder
          indicatorBuilder: (_, index) {
            if (index == activeIndex) {
            } else if (index < activeIndex) {}

            return Stack(
              children: [
                CustomPaint(
                  size: const Size(30, 30),
                  painter: _BezierPainter(
                    color: getColor(index),
                    drawStart: index > 0,
                    drawEnd: index < activeIndex,
                  ),
                ),
                DotIndicator(
                  size: 30,
                  color: getColor(index),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      '${index + 1}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
          connectorBuilder: (_, index, type) {
            if (index > 0) {
              if (index == activeIndex) {
                final prevColor = getColor(index - 1);
                final color = getColor(index);
                List<Color> gradientColors;
                if (type == ConnectorType.start) {
                  gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                } else {
                  gradientColors = [
                    prevColor,
                    Color.lerp(prevColor, color, 0.5)!
                  ];
                }
                return DecoratedLineConnector(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradientColors,
                    ),
                  ),
                );
              } else {
                return SolidLineConnector(
                  color: getColor(index),
                );
              }
            } else {
              return null;
            }
          },
          itemCount: 3,
        ),
      ),
    );
  }
}

class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    double angle;
    Offset offset1;
    Offset offset2;

    Path path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(
          0,
          size.height / 2,
          -radius,
          radius,
        )
        ..quadraticBezierTo(0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(
          size.width,
          size.height / 2,
          size.width + radius,
          radius,
        )
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}
