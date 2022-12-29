// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      invitationCode: json['invitationCode'] as String,
      imageUrl: json['imageUrl'] as String? ?? '',
      createdAt: timestampConverter.fromJson(json['createdAt']),
      updatedAt: timestampConverter.fromJson(json['updatedAt']),
      introduceCount: json['introduceCount'] as int? ?? 0,
      lastIntroduceDate: timestampConverter.fromJson(json['lastIntroduceDate']),
      isPremium: json['isPremium'] as bool? ?? false,
      isSendFavoriteNotification:
          json['isSendFavoriteNotification'] as bool? ?? true,
      isSendCommentsNotification:
          json['isSendCommentsNotification'] as bool? ?? true,
      isSendFollowNotification:
          json['isSendFollowNotification'] as bool? ?? true,
      cats:
          (json['cats'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'invitationCode': instance.invitationCode,
      'imageUrl': instance.imageUrl,
      'createdAt': timestampConverter.toJson(instance.createdAt),
      'updatedAt': timestampConverter.toJson(instance.updatedAt),
      'introduceCount': instance.introduceCount,
      'lastIntroduceDate':
          timestampConverter.toJson(instance.lastIntroduceDate),
      'isPremium': instance.isPremium,
      'isSendFavoriteNotification': instance.isSendFavoriteNotification,
      'isSendCommentsNotification': instance.isSendCommentsNotification,
      'isSendFollowNotification': instance.isSendFollowNotification,
      'cats': instance.cats,
    };
