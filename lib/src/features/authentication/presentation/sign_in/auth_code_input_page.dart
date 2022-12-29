import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/src/common_widgets/buttons/primary_button.dart';
import 'package:nekosama/src/common_widgets/stack_with_background.dart';
import 'package:nekosama/src/common_widgets/text_form/auth_text_form.dart';
import 'package:nekosama/src/utils/constants/colors.dart';

class AuthCodeInputPage extends HookConsumerWidget {
  const AuthCodeInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    final focusNode = FocusNode();

    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: StackWithBackground(
        child: Center(
          child: Column(
            children: [
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
              const Gap(50),
              const Text(
                '認証コードを入力してください',
                style: TextStyle(fontSize: 20),
              ),
              const Gap(80),
              AuthTextForm(
                title: '認証コード',
                hintText: '届いた認証コードを入力してください',
                maxLength: 6,
                formKey: formKey,
                controller: controller,
                type: FormType.other,
                validator: (value) {
                  return null;
                },
                focusNode: focusNode,
              ),
              const Gap(40),
              PrimaryButton(
                text: '認証',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    debugPrint('登録');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
