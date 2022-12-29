import 'package:flutter/material.dart';
import 'package:nekosama/ui/pages/auth/sign_in/components/sign_in_page_body.dart';
import 'package:nekosama/utils/constants/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldBackgroundColor,
      body: SignInPageBody(),
    );
  }
}
