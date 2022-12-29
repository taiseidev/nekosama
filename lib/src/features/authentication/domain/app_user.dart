import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekosama/src/utils/json_converter/timestamp.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    required String name,
    required String email,
    required String invitationCode,
    @Default('') String imageUrl,
    @timestampConverter DateTime? createdAt,
    @timestampConverter DateTime? updatedAt,
    @Default(0) int introduceCount,
    @timestampConverter DateTime? lastIntroduceDate,
    @Default(false) bool isPremium,
    @Default(true) bool isSendFavoriteNotification,
    @Default(true) bool isSendCommentsNotification,
    @Default(true) bool isSendFollowNotification,
    @Default(<String>[]) List<String> cats,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  factory AppUser.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return AppUser.fromJson(<String, dynamic>{
      ...data,
    });
  }

  const AppUser._();
}
