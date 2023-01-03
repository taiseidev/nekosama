import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nekosama/src/common_widgets/stack_with_background.dart';
import 'package:nekosama/src/utils/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: StackWithBackground(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('ホーム画面'),
                ElevatedButton(
                  onPressed: () {
                    context.go('/home/detail');
                  },
                  child: const Text('詳細画面へ遷移'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
