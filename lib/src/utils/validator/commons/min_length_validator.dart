// 現在は電話番号用にしか対応できていない
mixin MinLengthValidator {
  late int minLength;

  // mixinはコンストラクタを宣言できないためsetterを定義
  void minLengthInit(int minLength) => this.minLength = minLength;

  bool minLengthValidate(String value) => value.length == minLength;

  String getMinLengthValidatorMessage() => '$minLength文字入力してください';
}
