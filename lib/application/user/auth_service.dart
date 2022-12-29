import 'package:nekosama/infrastructure/firebase/user/firebase_user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  Future<void> signInPhoneNumber(String phoneNumber) async {
    state = const AsyncValue.loading();

    final repository = ref.read(firebaseUserRepositoryProvider);

    state = await AsyncValue.guard(() async {
      await repository.signIn(phoneNumber);
    });
  }
}
