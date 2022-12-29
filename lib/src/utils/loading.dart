import 'package:hooks_riverpod/hooks_riverpod.dart';

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
