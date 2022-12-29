import 'package:nekosama/src/features/authentication/data/user/firebase_user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  Future<void> signInPhoneNumber(String phoneNumber) async {
    final repository = ref.read(firebaseUserRepositoryProvider);

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await repository.signIn(phoneNumber);
    });
  }
}
