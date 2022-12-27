import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/ui/widgets/buttons/primary_button.dart';
import 'package:nekosama/ui/widgets/stack_with_background.dart';
import 'package:nekosama/utils/constants/string.dart';
import 'package:nekosama/utils/extensions/async_value.dart';
import 'package:nekosama/utils/validator/phone_validator.dart';

class SignInPageBody extends HookConsumerWidget {
  const SignInPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.handleAsyncValue<void>(
      loginStateProvider,
      complete: (context, data) async {
        // 認証コード入力画面へ遷移
        context.push('/authCodeInput');
      },
    );

    // バリデーション用クラスを初期化
    final phoneValidator = PhoneValidator();

    final controller = useTextEditingController();

    final formKey = GlobalKey<FormState>();

    return StackWithBackground(
      child: Column(
        children: [
          // 左寄せにするためRowで囲む
          Row(
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios_rounded),
              ),
            ],
          ),
          const Gap(50),
          const Text(
            inputPhoneNumber,
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
                    // 画面遷移時に自動でフォーカス
                    autofocus: true,
                    inputFormatters: [
                      // 入力されるTextを数字に限定
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    // キーボードを数字のみに設定
                    keyboardType: TextInputType.number,
                    // バリデーション
                    validator: (value) {
                      if (!phoneValidator.validate(value)) {
                        return phoneValidator.getErrorMessage();
                      }
                      return null;
                    },
                    // 文字数を11文字に限定
                    maxLength: 11,
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
          PrimaryButton(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                // フォーカスを外す
                FocusManager.instance.primaryFocus?.unfocus();
                // ログイン認証
                await ref.read(userServiceProvider).login();
                // フォームをクリア
                controller.clear();
              }
            },
            text: '認証コードを送信',
          ),
        ],
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
