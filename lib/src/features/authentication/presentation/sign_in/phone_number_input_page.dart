import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/src/common_widgets/buttons/primary_back_button.dart';
import 'package:nekosama/src/common_widgets/buttons/primary_button.dart';
import 'package:nekosama/src/common_widgets/process_timeline.dart';
import 'package:nekosama/src/common_widgets/stack_with_background.dart';
import 'package:nekosama/src/common_widgets/text_form/auth_text_form.dart';
import 'package:nekosama/src/features/authentication/presentation/sign_in/auth_controller.dart';
import 'package:nekosama/src/utils/constants/colors.dart';
import 'package:nekosama/src/utils/constants/string.dart';
import 'package:nekosama/src/utils/extensions/async_value.dart';
import 'package:nekosama/src/utils/validator/phone_validator.dart';

class PhoneNumberInputPage extends HookConsumerWidget {
  const PhoneNumberInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.handleAsyncValue<void>(
      authControllerProvider,
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
            const PrimaryBackButton(),
            const ProcessTimeline(activeIndex: 0),
            const Gap(30),
            const Text(
              inputPhoneNumber,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(80),
            Form(
              key: formKey,
              child: AuthTextForm(
                title: '電話番号',
                controller: controller,
                focusNode: focusNode,
                validator: (value) {
                  if (!phoneValidator.validate(value)) {
                    return phoneValidator.getErrorMessage();
                  }
                  return null;
                },
                type: FormType.phone,
                maxLength: 11,
                hintText: 'ハイフンなしで入力',
              ),
            ),
            const Gap(40),
            PrimaryButton(
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  // フォーカスを外す
                  focusNode.unfocus();
                  // ログイン認証
                  await ref
                      .read(authControllerProvider.notifier)
                      .verifyPhoneNumber(controller.text);
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
