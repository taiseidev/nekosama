import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nekosama/src/features/authentication/data/firestore_refs.dart';
import 'package:nekosama/src/features/authentication/domain/app_user.dart';
import 'package:nekosama/src/utils/uuid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_user_repository.g.dart';

@riverpod
FirebaseUserRepository firebaseUserRepository(FirebaseUserRepositoryRef ref) =>
    FirebaseUserRepository();

class FirebaseUserRepository {
  Future<void> signIn(String phoneNumber) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    await FirebaseAuth.instance.verifyPhoneNumber(
      // 日本のみ対応
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

  // Firestoreにユーザーデータを作成
  Future<void> createUser({
    required String uid,
    required String name,
    required String email,
  }) async {
    final date = DateTime.now();
    await appUserRef(userId: uid).set(
      AppUser(
        uid: uid,
        name: name,
        email: email,
        invitationCode: uuid,
        createdAt: date,
        updatedAt: date,
        lastIntroduceDate: date,
      ),
      SetOptions(merge: true),
    );
  }
}
