import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/ui/widgets/snackBar.dart';

final scaffoldMessengerKeyProvider = Provider(
  (_) => GlobalKey<ScaffoldMessengerState>(),
);

final scaffoldMessengerServiceProvider =
    Provider.autoDispose<ScaffoldMessengerService>(
  ScaffoldMessengerService.new,
);

class ScaffoldMessengerService {
  ScaffoldMessengerService(this._ref);

  final AutoDisposeProviderRef<ScaffoldMessengerService> _ref;

  /// スナックバーを表示
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message, {
    bool removeCurrentSnackBar = true,
  }) {
    final scaffoldMessengerState =
        _ref.watch(scaffoldMessengerKeyProvider).currentState!;

    if (removeCurrentSnackBar) {
      // 前のスナックバーを取り除く
      scaffoldMessengerState.removeCurrentSnackBar();
    }

    return scaffoldMessengerState
        .showSnackBar(primarySnackBar(message: message));
  }
}
