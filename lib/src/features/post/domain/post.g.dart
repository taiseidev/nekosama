// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as String,
      userId: json['userId'] as String,
      description: json['description'] as String,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
      likeCount: json['likeCount'] as int? ?? 0,
      createdAt: timestampConverter.fromJson(json['createdAt']),
      updatedAt: timestampConverter.fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'description': instance.description,
      'imageUrls': instance.imageUrls,
      'tags': instance.tags,
      'likeCount': instance.likeCount,
      'createdAt': timestampConverter.toJson(instance.createdAt),
      'updatedAt': timestampConverter.toJson(instance.updatedAt),
    };
