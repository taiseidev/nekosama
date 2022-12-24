# nekosama

# Riverpod
Providerを作成する際にnameプロパティに作成したProviderを識別できる名前を指定する。

# テスト

<br>
テストを実施する際は併せてカバレッジを出力する

<br>

```
flutter test --coverage
```
<br>

**/coverage/lcov.info**ファイルが生成されます。次に**lcov.info**ファイルからカバレッジレポートのHTMLファイルを出力。
<br>

```
genhtml coverage/lcov.info -o coverage/html
```
<br>

## 参考
https://tech.andpad.co.jp/entry/2020/11/17/170000
