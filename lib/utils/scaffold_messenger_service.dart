import 'package:flutter/material.dart';
import 'package:nekosama/ui/widgets/snack_bar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scaffold_messenger_service.g.dart';

@riverpod
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey(
  ScaffoldMessengerKeyRef ref,
) =>
    GlobalKey<ScaffoldMessengerState>();

@riverpod
ScaffoldMessengerService scaffoldMessengerService(
  ScaffoldMessengerServiceRef ref,
) =>
    ScaffoldMessengerService(ref);

class ScaffoldMessengerService {
  ScaffoldMessengerService(this.ref);

  final AutoDisposeProviderRef<ScaffoldMessengerService> ref;

  // スナックバーを表示
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message, {
    bool removeCurrentSnackBar = true,
  }) {
    final scaffoldMessengerState =
        ref.watch(scaffoldMessengerKeyProvider).currentState!;

    if (removeCurrentSnackBar) {
      // 前のスナックバーを取り除く
      scaffoldMessengerState.removeCurrentSnackBar();
    }

    // スナックバーを表示
    return scaffoldMessengerState
        .showSnackBar(primarySnackBar(message: message));
  }
}
