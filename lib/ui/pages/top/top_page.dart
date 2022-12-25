import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/ui/pages/top/components/top_page_body.dart';
import 'package:nekosama/utils/constants/colors.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.handleAsyncValue<void>(
    //   loginStateProvider,
    //   completeMessage: '登録完了！',
    // );
    return const Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: TopPageBody(),
    );
  }
}

// // ログイン状態を管理
// /// ログイン処理状態
// final loginStateProvider = StateProvider<AsyncValue<void>>(
//   (_) => const AsyncValue.data(null),
// );

// /// ユーザーサービスプロバイダー
// final userServiceProvider = Provider(UserService.new);

// class UserService {
//   UserService(this.ref);

//   final Ref ref;

//   /// ログインする
//   Future<void> login() async {
//     final notifier = ref.read(loginStateProvider.notifier);

//     // ログイン結果をローディング中にする
//     notifier.state = const AsyncValue.loading();

//     // ログイン処理を実行する
//     notifier.state = await AsyncValue.guard(() async {
//       // ここで実際にログイン処理を非同期で行う
//       await Future<void>.delayed(const Duration(seconds: 3));
//     });
//   }
// }
