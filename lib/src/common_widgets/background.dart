import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -200,
          left: -200,
          child: Blob.fromID(
            id: const ['11-2-69413'],
            size: 500,
            styles: BlobStyles(
              color: const Color(0xfff56958),
            ),
          ),
        ),
        Positioned(
          // top: 100,
          left: 100,
          child: Blob.fromID(
            id: const ['14-3-69413'],
            size: 700,
            styles: BlobStyles(
              color: const Color(0xff00cec9),
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: -400,
          child: Blob.fromID(
            id: const ['14-3-69414'],
            size: 700,
            styles: BlobStyles(
              color: const Color(0xfffdcb6e),
            ),
          ),
        ),
        Positioned(
          top: 550,
          child: Blob.fromID(
            id: const ['6-2-69413'],
            size: 600,
            styles: BlobStyles(
              color: const Color(0xff22345f),
            ),
          ),
        ),
      ],
    );
  }
}
