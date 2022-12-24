import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:nekosama/gen/assets.gen.dart';

/// ローディングの表示を管理
final loadingProvider =
    NotifierProvider<LoadingNotifier, bool>(LoadingNotifier.new);

class LoadingNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  /// ローディングを表示
  void show() => state = true;

  /// ローディングを非表示
  void hide() => state = false;
}

// 主に使用するローディング
class PrimaryLoading extends StatelessWidget {
  const PrimaryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(Assets.loading.primaryLoading),
    );
  }
}