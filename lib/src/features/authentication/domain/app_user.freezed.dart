// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get invitationCode => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  @timestampConverter
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @timestampConverter
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int get introduceCount => throw _privateConstructorUsedError;
  @timestampConverter
  DateTime? get lastIntroduceDate => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  bool get isSendFavoriteNotification => throw _privateConstructorUsedError;
  bool get isSendCommentsNotification => throw _privateConstructorUsedError;
  bool get isSendFollowNotification => throw _privateConstructorUsedError;
  List<String> get cats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String uid,
      String name,
      String email,
      String invitationCode,
      String imageUrl,
      @timestampConverter DateTime? createdAt,
      @timestampConverter DateTime? updatedAt,
      int introduceCount,
      @timestampConverter DateTime? lastIntroduceDate,
      bool isPremium,
      bool isSendFavoriteNotification,
      bool isSendCommentsNotification,
      bool isSendFollowNotification,
      List<String> cats});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? email = null,
    Object? invitationCode = null,
    Object? imageUrl = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? introduceCount = null,
    Object? lastIntroduceDate = freezed,
    Object? isPremium = null,
    Object? isSendFavoriteNotification = null,
    Object? isSendCommentsNotification = null,
    Object? isSendFollowNotification = null,
    Object? cats = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      invitationCode: null == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      introduceCount: null == introduceCount
          ? _value.introduceCount
          : introduceCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastIntroduceDate: freezed == lastIntroduceDate
          ? _value.lastIntroduceDate
          : lastIntroduceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendFavoriteNotification: null == isSendFavoriteNotification
          ? _value.isSendFavoriteNotification
          : isSendFavoriteNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendCommentsNotification: null == isSendCommentsNotification
          ? _value.isSendCommentsNotification
          : isSendCommentsNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendFollowNotification: null == isSendFollowNotification
          ? _value.isSendFollowNotification
          : isSendFollowNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      cats: null == cats
          ? _value.cats
          : cats // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String email,
      String invitationCode,
      String imageUrl,
      @timestampConverter DateTime? createdAt,
      @timestampConverter DateTime? updatedAt,
      int introduceCount,
      @timestampConverter DateTime? lastIntroduceDate,
      bool isPremium,
      bool isSendFavoriteNotification,
      bool isSendCommentsNotification,
      bool isSendFollowNotification,
      List<String> cats});
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$_AppUser>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? email = null,
    Object? invitationCode = null,
    Object? imageUrl = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? introduceCount = null,
    Object? lastIntroduceDate = freezed,
    Object? isPremium = null,
    Object? isSendFavoriteNotification = null,
    Object? isSendCommentsNotification = null,
    Object? isSendFollowNotification = null,
    Object? cats = null,
  }) {
    return _then(_$_AppUser(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      invitationCode: null == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      introduceCount: null == introduceCount
          ? _value.introduceCount
          : introduceCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastIntroduceDate: freezed == lastIntroduceDate
          ? _value.lastIntroduceDate
          : lastIntroduceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendFavoriteNotification: null == isSendFavoriteNotification
          ? _value.isSendFavoriteNotification
          : isSendFavoriteNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendCommentsNotification: null == isSendCommentsNotification
          ? _value.isSendCommentsNotification
          : isSendCommentsNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendFollowNotification: null == isSendFollowNotification
          ? _value.isSendFollowNotification
          : isSendFollowNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      cats: null == cats
          ? _value._cats
          : cats // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser extends _AppUser {
  const _$_AppUser(
      {required this.uid,
      required this.name,
      required this.email,
      required this.invitationCode,
      this.imageUrl = '',
      @timestampConverter this.createdAt,
      @timestampConverter this.updatedAt,
      this.introduceCount = 0,
      @timestampConverter this.lastIntroduceDate,
      this.isPremium = false,
      this.isSendFavoriteNotification = true,
      this.isSendCommentsNotification = true,
      this.isSendFollowNotification = true,
      final List<String> cats = const <String>[]})
      : _cats = cats,
        super._();

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String email;
  @override
  final String invitationCode;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @timestampConverter
  final DateTime? createdAt;
  @override
  @timestampConverter
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final int introduceCount;
  @override
  @timestampConverter
  final DateTime? lastIntroduceDate;
  @override
  @JsonKey()
  final bool isPremium;
  @override
  @JsonKey()
  final bool isSendFavoriteNotification;
  @override
  @JsonKey()
  final bool isSendCommentsNotification;
  @override
  @JsonKey()
  final bool isSendFollowNotification;
  final List<String> _cats;
  @override
  @JsonKey()
  List<String> get cats {
    if (_cats is EqualUnmodifiableListView) return _cats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cats);
  }

  @override
  String toString() {
    return 'AppUser(uid: $uid, name: $name, email: $email, invitationCode: $invitationCode, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, introduceCount: $introduceCount, lastIntroduceDate: $lastIntroduceDate, isPremium: $isPremium, isSendFavoriteNotification: $isSendFavoriteNotification, isSendCommentsNotification: $isSendCommentsNotification, isSendFollowNotification: $isSendFollowNotification, cats: $cats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.invitationCode, invitationCode) ||
                other.invitationCode == invitationCode) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.introduceCount, introduceCount) ||
                other.introduceCount == introduceCount) &&
            (identical(other.lastIntroduceDate, lastIntroduceDate) ||
                other.lastIntroduceDate == lastIntroduceDate) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.isSendFavoriteNotification,
                    isSendFavoriteNotification) ||
                other.isSendFavoriteNotification ==
                    isSendFavoriteNotification) &&
            (identical(other.isSendCommentsNotification,
                    isSendCommentsNotification) ||
                other.isSendCommentsNotification ==
                    isSendCommentsNotification) &&
            (identical(
                    other.isSendFollowNotification, isSendFollowNotification) ||
                other.isSendFollowNotification == isSendFollowNotification) &&
            const DeepCollectionEquality().equals(other._cats, _cats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      name,
      email,
      invitationCode,
      imageUrl,
      createdAt,
      updatedAt,
      introduceCount,
      lastIntroduceDate,
      isPremium,
      isSendFavoriteNotification,
      isSendCommentsNotification,
      isSendFollowNotification,
      const DeepCollectionEquality().hash(_cats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
      this,
    );
  }
}

abstract class _AppUser extends AppUser {
  const factory _AppUser(
      {required final String uid,
      required final String name,
      required final String email,
      required final String invitationCode,
      final String imageUrl,
      @timestampConverter final DateTime? createdAt,
      @timestampConverter final DateTime? updatedAt,
      final int introduceCount,
      @timestampConverter final DateTime? lastIntroduceDate,
      final bool isPremium,
      final bool isSendFavoriteNotification,
      final bool isSendCommentsNotification,
      final bool isSendFollowNotification,
      final List<String> cats}) = _$_AppUser;
  const _AppUser._() : super._();

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get email;
  @override
  String get invitationCode;
  @override
  String get imageUrl;
  @override
  @timestampConverter
  DateTime? get createdAt;
  @override
  @timestampConverter
  DateTime? get updatedAt;
  @override
  int get introduceCount;
  @override
  @timestampConverter
  DateTime? get lastIntroduceDate;
  @override
  bool get isPremium;
  @override
  bool get isSendFavoriteNotification;
  @override
  bool get isSendCommentsNotification;
  @override
  bool get isSendFollowNotification;
  @override
  List<String> get cats;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
