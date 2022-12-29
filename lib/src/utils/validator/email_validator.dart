import 'package:nekosama/src/utils/validator/commons/required_validator.dart';

class EmailValidator with RequiredValidator {
  EmailValidator() {
    requiredValidatorInit(phone);
  }

  int phoneNumberLength = 11;
  String phone = '電話番号';
  String errorMessage = '';

  bool validate(String? value) {
    var result = true;
    errorMessage = '';

    // 必須チェック
    result = requiredValidate(value);
    if (!result) {
      errorMessage = getRequiredValidatorMessage();
      return result;
    }

    // 適切なメールアドレスチェック
    final emailExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );
    result = emailExp.hasMatch(value!);
    if (!result) {
      errorMessage = '正しいメールアドレスではありません';
      return result;
    }

    return result;
  }

  String getErrorMessage() => errorMessage;
}
