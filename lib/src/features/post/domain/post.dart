import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekosama/src/utils/json_converter/timestamp.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String userId,
    required String description,
    @Default(<String>[]) List<String> imageUrls,
    @Default(<String>[]) List<String> tags,
    @Default(0) int likeCount,
    @timestampConverter DateTime? createdAt,
    @timestampConverter DateTime? updatedAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
