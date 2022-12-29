import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nekosama/src/gen/assets.gen.dart';

// 主に使用するローディング
class PrimaryLoading extends StatelessWidget {
  const PrimaryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        Assets.loading.primaryLoading,
        width: 150,
        height: 150,
      ),
    );
  }
}
