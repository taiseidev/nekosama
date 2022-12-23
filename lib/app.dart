import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/utils/extensions/async_value.dart';
import 'package:nekosama/utils/global_key.dart';
import 'package:nekosama/utils/loading.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingProvider);
    ref.handleAsyncValue<void>(
      loginStateProvider,
      completeMessage: '完了しました',
    );
    return MaterialApp(
      navigatorKey: ref.watch(navigatorKeyProvider),
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      builder: (context, child) {
        return Stack(
          children: [
            MediaQuery(
              // 端末依存のフォントを1に固定
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child!,
            ),
            // ローディングを表示
            if (isLoading)
              const ColoredBox(
                color: Colors.black26,
                child: PrimaryLoading(),
              )
          ],
        );
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            ref.read(userServiceProvider).login();
          },
          child: const Text('fdf'),
        ),
      ),
    );
  }
}

// ログイン状態を管理
/// ログイン処理状態
final loginStateProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
);

/// ユーザーサービスプロバイダー
final userServiceProvider = Provider(UserService.new);

class UserService {
  UserService(this.ref);

  final Ref ref;

  /// ログインする
  Future<void> login() async {
    final notifier = ref.read(loginStateProvider.notifier);

    // ログイン結果をローディング中にする
    notifier.state = const AsyncValue.loading();

    // ログイン処理を実行する
    notifier.state = await AsyncValue.guard(() async {
      // ここで実際にログイン処理を非同期で行う
      await Future.delayed(const Duration(seconds: 10));
    });
  }
}
