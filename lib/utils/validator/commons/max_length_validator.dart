mixin MaxLengthValidator {
  late int maxLength;

  void maxLengthInit(int maxLength) {
    this.maxLength = maxLength;
  }

  bool maxLengthValidate(String value) => value.length <= maxLength;

  String getMaxLengthValidatorMessage() => '$maxLength字まで入力できます。';
}
