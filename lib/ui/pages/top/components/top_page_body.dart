import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nekosama/gen/fonts.gen.dart';
import 'package:nekosama/ui/widgets/buttons/primary_button.dart';
import 'package:nekosama/ui/widgets/stack_with_background.dart';

class TopPageBody extends StatelessWidget {
  const TopPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return StackWithBackground(
      child: Center(
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
                    /// 会員登録はページをスタックして元の画面に戻れるようにしたいため
                    /// 基本的にはpushを使用する（goを使用すると新しいルートに遷移するため直前画面が破棄されてしまう）
                    context.push('/signIn');
                    // ログイン認証画面に遷移する
                    debugPrint('画面遷移');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: GestureDetector(
                    onTap: () {
                      context.push('/signIn');
                    },
                    child: const Text(
                      '登録する？',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
