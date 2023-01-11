import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nekosama/gen/assets.gen.dart';

// 主に使用するローディング
class PrimaryLoading extends StatelessWidget {
  const PrimaryLoading({super.key});

  static const loadingSize = 150.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        Assets.loading.primaryLoading,
        width: loadingSize,
        height: loadingSize,
      ),
    );
  }
}
