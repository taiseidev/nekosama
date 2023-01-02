import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nekosama/gen/assets.gen.dart';
import 'package:nekosama/src/common_widgets/buttons/primary_button.dart';
import 'package:nekosama/src/common_widgets/stack_with_background.dart';
import 'package:nekosama/src/common_widgets/top_page.dart';
import 'package:nekosama/src/utils/constants/colors.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
    required this.error,
  });

  final Exception error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: StackWithBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Lottie.asset(
                    Assets.loading.notFoundLoading,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(' ページが見つかりません...'),
              const SizedBox(height: 40),
              PrimaryButton(
                text: 'トップページに戻る',
                onTap: () {
                  // go_routerでやり方が分からなかったので一旦Navigator1.0で実装
                  // pushして他の画面を残した状態なのでremoveするように修正する
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).push<void>(
                    MaterialPageRoute(
                      builder: (context) => const TopPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
