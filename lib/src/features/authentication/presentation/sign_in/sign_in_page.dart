import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/src/common_widgets/buttons/primary_button.dart';
import 'package:nekosama/src/common_widgets/stack_with_background.dart';
import 'package:nekosama/src/common_widgets/text_form/auth_text_form.dart';
import 'package:nekosama/src/features/authentication/presentation/sign_in/auth_service.dart';
import 'package:nekosama/src/utils/constants/colors.dart';
import 'package:nekosama/src/utils/constants/string.dart';
import 'package:nekosama/src/utils/extensions/async_value.dart';
import 'package:nekosama/src/utils/validator/phone_validator.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.handleAsyncValue<void>(
      authServiceProvider,
      complete: (context, data) async {
        // 認証コード入力画面へ遷移
        context.push('/authCodeInput');
      },
    );

    // バリデーション用クラスを初期化
    final phoneValidator = PhoneValidator();

    final controller = useTextEditingController();

    final formKey = GlobalKey<FormState>();

    final focusNode = FocusNode();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldBackgroundColor,
      body: StackWithBackground(
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
            AuthTextForm(
              title: '電話番号',
              formKey: formKey,
              controller: controller,
              validator: (value) {
                if (!phoneValidator.validate(value)) {
                  return phoneValidator.getErrorMessage();
                }
                return null;
              },
              type: FormType.phone,
              maxLength: 11,
              hintText: 'ハイフンなしで入力',
              focusNode: focusNode,
            ),
            const Gap(40),
            PrimaryButton(
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  // フォーカスを外す
                  focusNode.unfocus();
                  // ログイン認証
                  await ref
                      .read(authServiceProvider.notifier)
                      .signInPhoneNumber(controller.text);
                  // フォームをクリア
                  controller.clear();
                }
              },
              text: '認証コードを送信',
            ),
          ],
        ),
      ),
    );
  }
}
