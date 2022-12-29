import 'package:nekosama/src/features/authentication/data/firebase_user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  // 電話番号認証
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    final repository = ref.read(firebaseUserRepositoryProvider);

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await repository.signIn(phoneNumber);
    });
  }

  // 認証コード送信 & ユーザー登録
  Future<void> registerUser(String phoneNumber) async {
    final repository = ref.read(firebaseUserRepositoryProvider);

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await repository.signIn(phoneNumber);
    });
  }

  // Firestoreにユーザーデータを作成
  Future<void> createUser({
    required String name,
    required String email,
  }) async {
    final repository = ref.read(firebaseUserRepositoryProvider);

    state = const AsyncValue.loading();

    // 仮のuid
    const uid = 'ldvidsbdilb48779bkgkv4k25';

    state = await AsyncValue.guard(() async {
      await repository.createUser(
        uid: uid,
        name: name,
        email: email,
      );
    });
  }
}
