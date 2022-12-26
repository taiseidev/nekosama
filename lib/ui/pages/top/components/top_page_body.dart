import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/gen/fonts.gen.dart';
import 'package:nekosama/ui/widgets/buttons/cat_button.dart';
import 'package:nekosama/ui/widgets/stack_with_background.dart';

class TopPageBody extends ConsumerWidget {
  const TopPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StackWithBackground(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'nekosama',
              style: TextStyle(
                fontSize: 50,
                fontFamily: FontFamily.trainOne,
              ),
            ),
            Gap(40),
            Text(
              '~ ねこちゃんで溢れたSNS ~',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Gap(100),
            CatButton(),
          ],
        ),
      ),
    );
  }
}

// ボタンのpositionを管理するProvider
final boolProvider = StateProvider<bool>((_) => false);
