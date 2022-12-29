import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_user_repository.g.dart';

@riverpod
FirebaseUserRepository firebaseUserRepository(FirebaseUserRepositoryRef ref) =>
    FirebaseUserRepository();

class FirebaseUserRepository {
  Future<void> signIn(String phoneNumber) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    debugPrint('発火しています');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+81$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Androidで電話番号認証を行う場合
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // エラーが発生した場合
        if (e.code == 'invalid-phone-number') {
          debugPrint('電話番号が正しくありません。');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // iosで電話番号認証を行う場合
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // タイムアウト時の挙動を指定しない場合は空欄でも問題なし
      },
    );
  }
}
