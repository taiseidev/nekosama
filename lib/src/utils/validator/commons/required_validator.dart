mixin RequiredValidator {
  late String form;

  void requiredValidatorInit(String form) => this.form = form;

  bool requiredValidate(String? value) {
    if (value == null) {
      return false;
    }

    return value.trim().isNotEmpty;
  }

  String getRequiredValidatorMessage() => '$formを入力してください';
}
