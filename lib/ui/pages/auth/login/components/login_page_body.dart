import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nekosama/gen/fonts.gen.dart';
import 'package:nekosama/ui/widgets/background.dart';
import 'package:nekosama/ui/widgets/buttons/primary_button.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const PrimaryBackground(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'nekosama',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: FontFamily.trainOne,
                ),
              ),
              const Gap(40),
              const Text(
                '~ ねこちゃんで溢れたSNS ~',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Gap(20),
              Stack(
                alignment: Alignment.center,
                children: [
                  PrimaryButton(
                    onTap: () async {
                      // ログイン認証画面に遷移する
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(
                      '登録するニャ？',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
