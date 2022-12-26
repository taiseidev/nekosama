import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/ui/widgets/stack_with_background.dart';
import 'package:nekosama/utils/extensions/async_value.dart';

class SignInPageBody extends HookConsumerWidget {
  const SignInPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.handleAsyncValue<void>(
      loginStateProvider,
      completeMessage: 'ログインしました！',
    );

    final controller = useTextEditingController();

    final formKey = GlobalKey<FormState>();

    return StackWithBackground(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(100),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                  ),
                ),
              ],
            ),
            const Gap(24),
            const Text(
              '電話番号を入力してください',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('電話番号'),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      controller: controller,
                      autofocus: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ], // 入力されるTextを数字に限定
                      keyboardType: TextInputType.number, // キーボードを数字のみに設定
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'error';
                        }
                        return null;
                      },
                      maxLength: 11, // 文字すすを11文字に限定
                      decoration: const InputDecoration(
                        hintText: 'ハイフンなしで入力',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(40),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff434243),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), //こちらを適用
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    ref.read(userServiceProvider).login();
                  }
                },
                child: const Text('認証コードを送信'),
              ),
            ),
            // const Gap(20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: const [
            //     Divider(
            //       thickness: 2,
            //     ),
            //     Text('OR'),
            //     Divider(
            //       thickness: 2,
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   child: SignInButton(
            //     Buttons.Google,
            //     onPressed: () {},
            //   ),
            // ),
            // SignInButton(
            //   Buttons.Apple,
            //   onPressed: () {},
            // ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

/// ログイン処理状態
final loginStateProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
);

/// ユーザーサービスプロバイダー
final userServiceProvider = Provider(
  UserService.new,
);

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
      await Future<void>.delayed(const Duration(seconds: 3));
    });
  }
}
