import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum FormType {
  phone,
  other,
}

class AuthTextForm extends StatelessWidget {
  const AuthTextForm({
    super.key,
    required this.title,
    required this.hintText,
    required this.maxLength,
    required this.focusNode,
    required this.controller,
    required this.type,
    required this.validator,
  });

  final String title;
  final String hintText;
  final int maxLength;

  final FocusNode focusNode;
  final TextEditingController controller;
  final FormType type;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          TextFormField(
            focusNode: focusNode,
            controller: controller,
            // 画面遷移時に自動でフォーカス
            autofocus: true,
            inputFormatters: [
              // 入力されるTextを数字に限定
              if (type == FormType.phone) FilteringTextInputFormatter.digitsOnly
            ],
            // キーボードを数字のみに設定
            keyboardType: type == FormType.phone
                ? TextInputType.number
                : TextInputType.none,
            // バリデーション
            validator: validator,
            // 文字数を11文字に限定
            maxLength: maxLength,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
