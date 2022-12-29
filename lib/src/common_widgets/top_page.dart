import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nekosama/gen/fonts.gen.dart';
import 'package:nekosama/src/common_widgets/buttons/cat_button.dart';
import 'package:nekosama/src/common_widgets/stack_with_background.dart';
import 'package:nekosama/src/utils/constants/colors.dart';
import 'package:nekosama/src/utils/constants/string.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: StackWithBackground(
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
                style: TextStyle(fontSize: 20),
              ),
              Gap(60),
              CatButton(),
            ],
          ),
        ),
      ),
    );
  }
}
