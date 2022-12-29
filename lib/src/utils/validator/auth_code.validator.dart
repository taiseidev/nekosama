import 'package:nekosama/src/utils/validator/commons/min_length_validator.dart';
import 'package:nekosama/src/utils/validator/commons/required_validator.dart';

class AuthCodeValidator with RequiredValidator, MinLengthValidator {
  AuthCodeValidator() {
    // 電話番号の最小値（最大値）
    minLengthInit(authCodeLength);
    requiredValidatorInit(authCode);
  }

  int authCodeLength = 6;
  String authCode = '認証コード';
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

    // 最小値チェック
    result = minLengthValidate(value!);
    if (!result) {
      errorMessage = getMinLengthValidatorMessage();
      return result;
    }

    return result;
  }

  String getErrorMessage() => errorMessage;
}
