import 'package:nekosama/src/utils/validator/commons/min_length_validator.dart';
import 'package:nekosama/src/utils/validator/commons/required_validator.dart';

class PhoneValidator with RequiredValidator, MinLengthValidator {
  PhoneValidator() {
    // 電話番号の最小値（最大値）
    minLengthInit(phoneNumberLength);
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

    // 最小値チェック
    result = minLengthValidate(value!);
    if (!result) {
      errorMessage = getMinLengthValidatorMessage();
      return result;
    }

    // 適切な（携帯）電話番号チェック
    // 060は導入してすぐに対応できるようにするため
    final phoneNumberPattern = RegExp(r'^(060|070|080|090)[0-9]{8}$');
    result = phoneNumberPattern.hasMatch(value);
    if (!result) {
      errorMessage = '正しい電話番号ではありません';
      return result;
    }

    return result;
  }

  String getErrorMessage() => errorMessage;
}
