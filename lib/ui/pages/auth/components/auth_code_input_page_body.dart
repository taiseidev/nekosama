import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/ui/widgets/stack_with_background.dart';

class AuthCodeInputPageBody extends HookConsumerWidget {
  const AuthCodeInputPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    final formKey = GlobalKey<FormState>();
    return StackWithBackground(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                children: [
                  const Text(
                    '名前とメールアドレスを入力してください',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Gap(80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('お名前'),
                            TextFormField(
                              controller: controller,
                              autofocus: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ], // 入力されるTextを数字に限定
                              keyboardType:
                                  TextInputType.number, // キーボードを数字のみに設定
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'error';
                                }
                                return null;
                              },
                              maxLength: 11, // 文字すすを11文字に限定
                              decoration: const InputDecoration(
                                hintText: '10文字以下で入力',
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
                            const Text('メールアドレス'),
                            TextFormField(
                              controller: controller,
                              autofocus: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ], // 入力されるTextを数字に限定
                              keyboardType:
                                  TextInputType.number, // キーボードを数字のみに設定
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
                            const Gap(40),
                            SizedBox(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff434243),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), //こちらを適用
                                  ),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    debugPrint('登録');
                                  }
                                },
                                child: const Text('登録'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
