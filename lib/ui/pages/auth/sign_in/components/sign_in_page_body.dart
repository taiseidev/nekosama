import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nekosama/ui/widgets/stack_with_background.dart';

class SignInPageBody extends StatelessWidget {
  const SignInPageBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                  TextFormField(
                    autofocus: true,
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
                ],
              ),
            ),
            const Gap(40),
            ElevatedButton(
              onPressed: () {},
              child: const Text('電話番号を送信'),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Divider(
                  thickness: 2,
                ),
                Text('OR'),
                Divider(
                  thickness: 2,
                ),
              ],
            ),
            SizedBox(
              child: SignInButton(
                Buttons.Google,
                onPressed: () {},
              ),
            ),
            SignInButton(
              Buttons.Apple,
              onPressed: () {},
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
