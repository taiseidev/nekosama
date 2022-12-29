import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/gen/assets.gen.dart';
import 'package:nekosama/src/common_widgets/buttons/primary_back_button.dart';
import 'package:nekosama/src/common_widgets/buttons/primary_button.dart';
import 'package:nekosama/src/common_widgets/stack_with_background.dart';
import 'package:nekosama/src/utils/constants/colors.dart';
import 'package:nekosama/src/utils/validator/auth_code.validator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthCodeInputPage extends HookConsumerWidget {
  const AuthCodeInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authCodeValidator = AuthCodeValidator();

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
              const PrimaryBackButton(),
              const Gap(50),
              const Text(
                '認証コードを入力してください',
                style: TextStyle(fontSize: 20),
              ),
              const Gap(80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text('認証コード'),
                      ],
                    ),
                    const Gap(8),
                    Form(
                      key: formKey,
                      child: PinCodeTextField(
                        focusNode: focusNode,
                        autoFocus: true,
                        appContext: context,
                        length: 6,
                        obscureText: true,
                        // 非表示時の画像
                        obscuringWidget:
                            Image.asset(Assets.images.nikukyu.path),
                        // 一度番号を表示してから文字を隠す
                        blinkWhenObscuring: true,
                        animationType: AnimationType.scale,
                        validator: (value) {
                          if (!authCodeValidator.validate(value)) {
                            return authCodeValidator.getErrorMessage();
                          }
                          return null;
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeColor: const Color(0xff22345f),
                          selectedColor: const Color(0xff22345f),
                          activeFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          errorBorderColor: Colors.white,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorTextSpace: 24,
                        controller: controller,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          debugPrint(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(40),
              PrimaryButton(
                text: '認証',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    focusNode.unfocus();
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
