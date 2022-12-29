// ignore_for_file: prefer_foreach

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/src/common_widgets/buttons/primary_back_button.dart';
import 'package:nekosama/src/common_widgets/buttons/primary_button.dart';
import 'package:nekosama/src/common_widgets/process_timeline.dart';
import 'package:nekosama/src/common_widgets/stack_with_background.dart';
import 'package:nekosama/src/features/authentication/presentation/sign_in/auth_controller.dart';
import 'package:nekosama/src/utils/constants/colors.dart';
import 'package:nekosama/src/utils/extensions/async_value.dart';
import 'package:nekosama/src/utils/validator/email_validator.dart';
import 'package:nekosama/src/utils/validator/name_validator.dart';

class NameEmailInputPage extends HookConsumerWidget {
  const NameEmailInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.handleAsyncValue<void>(
      authControllerProvider,
      completeMessage: '会員登録が完了しました',
      complete: (context, data) async {
        // 認証コード入力画面へ遷移
        context.push('/home');
      },
    );

    // バリデーション用クラスを初期化
    final nameValidator = NameValidator();
    final emailValidator = EmailValidator();

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();

    final formKey = GlobalKey<FormState>();

    final nameFocusNode = FocusNode();
    final emailFocusNode = FocusNode();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldBackgroundColor,
      body: StackWithBackground(
        child: Column(
          children: [
            const PrimaryBackButton(),
            const ProcessTimeline(activeIndex: 2),
            const Gap(10),
            const Text(
              '名前とメールアドレスを\n入力してください',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(30),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('名前'),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          maxLength: 10,

                          focusNode: nameFocusNode,
                          controller: nameController,
                          // 画面遷移時に自動でフォーカス
                          autofocus: true,
                          // バリデーション
                          validator: (value) {
                            if (!nameValidator.validate(value)) {
                              return nameValidator.getErrorMessage();
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            counterText: '',
                            hintText: '10文字以内で入力',
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
                      ],
                    ),
                  ),
                  const Gap(30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('メールアドレス'),
                        TextFormField(
                          focusNode: emailFocusNode,
                          controller: emailController,
                          // バリデーション
                          validator: (value) {
                            if (!emailValidator.validate(value)) {
                              return emailValidator.getErrorMessage();
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'メールアドレスを入力',
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            PrimaryButton(
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  emailFocusNode.unfocus();
                  debugPrint('登録が完了しました');
                  // ログイン認証
                  await ref
                      .read(authControllerProvider.notifier)
                      .signInPhoneNumber(nameController.text);
                  nameController.clear();
                  emailController.clear();
                }
              },
              text: '登録',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: StackWithBackground(
          child: Center(
            child: Text('登録が完了しました'),
          ),
        ),
      ),
    );
  }
}
