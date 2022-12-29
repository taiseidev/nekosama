import 'package:flutter/material.dart';
import 'package:nekosama/ui/pages/auth/components/auth_code_input_page_body.dart';
import 'package:nekosama/utils/constants/colors.dart';

class AuthCodeInputPage extends StatelessWidget {
  const AuthCodeInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: AuthCodeInputPageBody(),
    );
  }
}
