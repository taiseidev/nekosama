import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum FormType {
  phone,
  other,
}

class AuthTextForm extends StatefulWidget {
  const AuthTextForm({
    super.key,
    required this.title,
    required this.hintText,
    required this.maxLength,
    required this.formKey,
    required this.focusNode,
    required this.controller,
    required this.type,
    required this.validator,
  });

  final String title;
  final String hintText;
  final int maxLength;
  final Key formKey;
  final FocusNode focusNode;
  final TextEditingController controller;
  final FormType type;
  final String? Function(String?)? validator;

  @override
  State<AuthTextForm> createState() => _AuthTextFormState();
}

class _AuthTextFormState extends State<AuthTextForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Form(
            key: widget.formKey,
            child: TextFormField(
              focusNode: widget.focusNode,
              controller: widget.controller,
              // 画面遷移時に自動でフォーカス
              autofocus: true,
              inputFormatters: [
                // 入力されるTextを数字に限定
                if (widget.type == FormType.phone)
                  FilteringTextInputFormatter.digitsOnly
              ],
              // キーボードを数字のみに設定
              keyboardType: widget.type == FormType.phone
                  ? TextInputType.number
                  : TextInputType.none,
              // バリデーション
              validator: widget.validator,
              // 文字数を11文字に限定
              maxLength: widget.maxLength,
              decoration: InputDecoration(
                hintText: widget.hintText,
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
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }
}
