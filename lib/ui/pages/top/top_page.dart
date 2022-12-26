import 'package:flutter/material.dart';
import 'package:nekosama/ui/pages/top/components/top_page_body.dart';
import 'package:nekosama/utils/constants/colors.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: TopPageBody(),
    );
  }
}
