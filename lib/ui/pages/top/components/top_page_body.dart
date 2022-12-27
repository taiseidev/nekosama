import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/gen/fonts.gen.dart';
import 'package:nekosama/ui/widgets/buttons/cat_button.dart';
import 'package:nekosama/ui/widgets/stack_with_background.dart';
import 'package:nekosama/utils/constants/string.dart';

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
              appName,
              style: TextStyle(
                fontSize: 50,
                fontFamily: FontFamily.trainOne,
              ),
            ),
            Gap(20),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Gap(60),
            CatButton(),
          ],
        ),
      ),
    );
  }
}
