import 'package:nekosama/src/utils/validator/commons/max_length_validator.dart';
import 'package:nekosama/src/utils/validator/commons/required_validator.dart';

class NameValidator with RequiredValidator, MaxLengthValidator {
  NameValidator() {
    // 名前の最小値（最大値）
    maxLengthInit(nameNumberLength);
    requiredValidatorInit(phone);
  }

  int nameNumberLength = 10;
  String phone = '名前';
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

    // 最大値チェック
    result = maxLengthValidate(value!);
    if (!result) {
      errorMessage = getMaxLengthValidatorMessage();
      return result;
    }

    // 適切な名前チェック
    final ng = ngList.contains(value);
    if (ng) {
      errorMessage = 'この名前は登録できません';
      return false;
    }

    return result;
  }

  String getErrorMessage() => errorMessage;
}

// NGワードを登録していく
const ngList = <String>[
  '',
];
