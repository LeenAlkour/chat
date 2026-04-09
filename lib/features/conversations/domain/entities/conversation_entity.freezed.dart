// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationEntity {

 String get id; String get type; DateTime get lastMessageAt; DateTime get createdAt; String? get lastMessageContent; String? get lastMessageType; String? get lastMessageSenderId; int get unreadCount; String? get otherUserId; String? get otherUsername; String? get otherAvatarUrl; String? get otherFullName; bool get otherIsOnline; DateTime? get otherLastSeen; String get draft; bool get isMuted; double get scrollOffset;
/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationEntityCopyWith<ConversationEntity> get copyWith => _$ConversationEntityCopyWithImpl<ConversationEntity>(this as ConversationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastMessageContent, lastMessageContent) || other.lastMessageContent == lastMessageContent)&&(identical(other.lastMessageType, lastMessageType) || other.lastMessageType == lastMessageType)&&(identical(other.lastMessageSenderId, lastMessageSenderId) || other.lastMessageSenderId == lastMessageSenderId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&(identical(other.otherUsername, otherUsername) || other.otherUsername == otherUsername)&&(identical(other.otherAvatarUrl, otherAvatarUrl) || other.otherAvatarUrl == otherAvatarUrl)&&(identical(other.otherFullName, otherFullName) || other.otherFullName == otherFullName)&&(identical(other.otherIsOnline, otherIsOnline) || other.otherIsOnline == otherIsOnline)&&(identical(other.otherLastSeen, otherLastSeen) || other.otherLastSeen == otherLastSeen)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.scrollOffset, scrollOffset) || other.scrollOffset == scrollOffset));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,lastMessageAt,createdAt,lastMessageContent,lastMessageType,lastMessageSenderId,unreadCount,otherUserId,otherUsername,otherAvatarUrl,otherFullName,otherIsOnline,otherLastSeen,draft,isMuted,scrollOffset);

@override
String toString() {
  return 'ConversationEntity(id: $id, type: $type, lastMessageAt: $lastMessageAt, createdAt: $createdAt, lastMessageContent: $lastMessageContent, lastMessageType: $lastMessageType, lastMessageSenderId: $lastMessageSenderId, unreadCount: $unreadCount, otherUserId: $otherUserId, otherUsername: $otherUsername, otherAvatarUrl: $otherAvatarUrl, otherFullName: $otherFullName, otherIsOnline: $otherIsOnline, otherLastSeen: $otherLastSeen, draft: $draft, isMuted: $isMuted, scrollOffset: $scrollOffset)';
}


}

/// @nodoc
abstract mixin class $ConversationEntityCopyWith<$Res>  {
  factory $ConversationEntityCopyWith(ConversationEntity value, $Res Function(ConversationEntity) _then) = _$ConversationEntityCopyWithImpl;
@useResult
$Res call({
 String id, String type, DateTime lastMessageAt, DateTime createdAt, String? lastMessageContent, String? lastMessageType, String? lastMessageSenderId, int unreadCount, String? otherUserId, String? otherUsername, String? otherAvatarUrl, String? otherFullName, bool otherIsOnline, DateTime? otherLastSeen, String draft, bool isMuted, double scrollOffset
});




}
/// @nodoc
class _$ConversationEntityCopyWithImpl<$Res>
    implements $ConversationEntityCopyWith<$Res> {
  _$ConversationEntityCopyWithImpl(this._self, this._then);

  final ConversationEntity _self;
  final $Res Function(ConversationEntity) _then;

/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? lastMessageAt = null,Object? createdAt = null,Object? lastMessageContent = freezed,Object? lastMessageType = freezed,Object? lastMessageSenderId = freezed,Object? unreadCount = null,Object? otherUserId = freezed,Object? otherUsername = freezed,Object? otherAvatarUrl = freezed,Object? otherFullName = freezed,Object? otherIsOnline = null,Object? otherLastSeen = freezed,Object? draft = null,Object? isMuted = null,Object? scrollOffset = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessageContent: freezed == lastMessageContent ? _self.lastMessageContent : lastMessageContent // ignore: cast_nullable_to_non_nullable
as String?,lastMessageType: freezed == lastMessageType ? _self.lastMessageType : lastMessageType // ignore: cast_nullable_to_non_nullable
as String?,lastMessageSenderId: freezed == lastMessageSenderId ? _self.lastMessageSenderId : lastMessageSenderId // ignore: cast_nullable_to_non_nullable
as String?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,otherUserId: freezed == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String?,otherUsername: freezed == otherUsername ? _self.otherUsername : otherUsername // ignore: cast_nullable_to_non_nullable
as String?,otherAvatarUrl: freezed == otherAvatarUrl ? _self.otherAvatarUrl : otherAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,otherFullName: freezed == otherFullName ? _self.otherFullName : otherFullName // ignore: cast_nullable_to_non_nullable
as String?,otherIsOnline: null == otherIsOnline ? _self.otherIsOnline : otherIsOnline // ignore: cast_nullable_to_non_nullable
as bool,otherLastSeen: freezed == otherLastSeen ? _self.otherLastSeen : otherLastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as String,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,scrollOffset: null == scrollOffset ? _self.scrollOffset : scrollOffset // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationEntity].
extension ConversationEntityPatterns on ConversationEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationEntity value)  $default,){
final _that = this;
switch (_that) {
case _ConversationEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  DateTime lastMessageAt,  DateTime createdAt,  String? lastMessageContent,  String? lastMessageType,  String? lastMessageSenderId,  int unreadCount,  String? otherUserId,  String? otherUsername,  String? otherAvatarUrl,  String? otherFullName,  bool otherIsOnline,  DateTime? otherLastSeen,  String draft,  bool isMuted,  double scrollOffset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
return $default(_that.id,_that.type,_that.lastMessageAt,_that.createdAt,_that.lastMessageContent,_that.lastMessageType,_that.lastMessageSenderId,_that.unreadCount,_that.otherUserId,_that.otherUsername,_that.otherAvatarUrl,_that.otherFullName,_that.otherIsOnline,_that.otherLastSeen,_that.draft,_that.isMuted,_that.scrollOffset);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  DateTime lastMessageAt,  DateTime createdAt,  String? lastMessageContent,  String? lastMessageType,  String? lastMessageSenderId,  int unreadCount,  String? otherUserId,  String? otherUsername,  String? otherAvatarUrl,  String? otherFullName,  bool otherIsOnline,  DateTime? otherLastSeen,  String draft,  bool isMuted,  double scrollOffset)  $default,) {final _that = this;
switch (_that) {
case _ConversationEntity():
return $default(_that.id,_that.type,_that.lastMessageAt,_that.createdAt,_that.lastMessageContent,_that.lastMessageType,_that.lastMessageSenderId,_that.unreadCount,_that.otherUserId,_that.otherUsername,_that.otherAvatarUrl,_that.otherFullName,_that.otherIsOnline,_that.otherLastSeen,_that.draft,_that.isMuted,_that.scrollOffset);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  DateTime lastMessageAt,  DateTime createdAt,  String? lastMessageContent,  String? lastMessageType,  String? lastMessageSenderId,  int unreadCount,  String? otherUserId,  String? otherUsername,  String? otherAvatarUrl,  String? otherFullName,  bool otherIsOnline,  DateTime? otherLastSeen,  String draft,  bool isMuted,  double scrollOffset)?  $default,) {final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
return $default(_that.id,_that.type,_that.lastMessageAt,_that.createdAt,_that.lastMessageContent,_that.lastMessageType,_that.lastMessageSenderId,_that.unreadCount,_that.otherUserId,_that.otherUsername,_that.otherAvatarUrl,_that.otherFullName,_that.otherIsOnline,_that.otherLastSeen,_that.draft,_that.isMuted,_that.scrollOffset);case _:
  return null;

}
}

}

/// @nodoc


class _ConversationEntity implements ConversationEntity {
  const _ConversationEntity({required this.id, required this.type, required this.lastMessageAt, required this.createdAt, this.lastMessageContent, this.lastMessageType, this.lastMessageSenderId, required this.unreadCount, this.otherUserId, this.otherUsername, this.otherAvatarUrl, this.otherFullName, this.otherIsOnline = false, this.otherLastSeen, this.draft = '', this.isMuted = false, this.scrollOffset = 0.0});
  

@override final  String id;
@override final  String type;
@override final  DateTime lastMessageAt;
@override final  DateTime createdAt;
@override final  String? lastMessageContent;
@override final  String? lastMessageType;
@override final  String? lastMessageSenderId;
@override final  int unreadCount;
@override final  String? otherUserId;
@override final  String? otherUsername;
@override final  String? otherAvatarUrl;
@override final  String? otherFullName;
@override@JsonKey() final  bool otherIsOnline;
@override final  DateTime? otherLastSeen;
@override@JsonKey() final  String draft;
@override@JsonKey() final  bool isMuted;
@override@JsonKey() final  double scrollOffset;

/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationEntityCopyWith<_ConversationEntity> get copyWith => __$ConversationEntityCopyWithImpl<_ConversationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastMessageContent, lastMessageContent) || other.lastMessageContent == lastMessageContent)&&(identical(other.lastMessageType, lastMessageType) || other.lastMessageType == lastMessageType)&&(identical(other.lastMessageSenderId, lastMessageSenderId) || other.lastMessageSenderId == lastMessageSenderId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&(identical(other.otherUsername, otherUsername) || other.otherUsername == otherUsername)&&(identical(other.otherAvatarUrl, otherAvatarUrl) || other.otherAvatarUrl == otherAvatarUrl)&&(identical(other.otherFullName, otherFullName) || other.otherFullName == otherFullName)&&(identical(other.otherIsOnline, otherIsOnline) || other.otherIsOnline == otherIsOnline)&&(identical(other.otherLastSeen, otherLastSeen) || other.otherLastSeen == otherLastSeen)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.scrollOffset, scrollOffset) || other.scrollOffset == scrollOffset));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,lastMessageAt,createdAt,lastMessageContent,lastMessageType,lastMessageSenderId,unreadCount,otherUserId,otherUsername,otherAvatarUrl,otherFullName,otherIsOnline,otherLastSeen,draft,isMuted,scrollOffset);

@override
String toString() {
  return 'ConversationEntity(id: $id, type: $type, lastMessageAt: $lastMessageAt, createdAt: $createdAt, lastMessageContent: $lastMessageContent, lastMessageType: $lastMessageType, lastMessageSenderId: $lastMessageSenderId, unreadCount: $unreadCount, otherUserId: $otherUserId, otherUsername: $otherUsername, otherAvatarUrl: $otherAvatarUrl, otherFullName: $otherFullName, otherIsOnline: $otherIsOnline, otherLastSeen: $otherLastSeen, draft: $draft, isMuted: $isMuted, scrollOffset: $scrollOffset)';
}


}

/// @nodoc
abstract mixin class _$ConversationEntityCopyWith<$Res> implements $ConversationEntityCopyWith<$Res> {
  factory _$ConversationEntityCopyWith(_ConversationEntity value, $Res Function(_ConversationEntity) _then) = __$ConversationEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, DateTime lastMessageAt, DateTime createdAt, String? lastMessageContent, String? lastMessageType, String? lastMessageSenderId, int unreadCount, String? otherUserId, String? otherUsername, String? otherAvatarUrl, String? otherFullName, bool otherIsOnline, DateTime? otherLastSeen, String draft, bool isMuted, double scrollOffset
});




}
/// @nodoc
class __$ConversationEntityCopyWithImpl<$Res>
    implements _$ConversationEntityCopyWith<$Res> {
  __$ConversationEntityCopyWithImpl(this._self, this._then);

  final _ConversationEntity _self;
  final $Res Function(_ConversationEntity) _then;

/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? lastMessageAt = null,Object? createdAt = null,Object? lastMessageContent = freezed,Object? lastMessageType = freezed,Object? lastMessageSenderId = freezed,Object? unreadCount = null,Object? otherUserId = freezed,Object? otherUsername = freezed,Object? otherAvatarUrl = freezed,Object? otherFullName = freezed,Object? otherIsOnline = null,Object? otherLastSeen = freezed,Object? draft = null,Object? isMuted = null,Object? scrollOffset = null,}) {
  return _then(_ConversationEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessageContent: freezed == lastMessageContent ? _self.lastMessageContent : lastMessageContent // ignore: cast_nullable_to_non_nullable
as String?,lastMessageType: freezed == lastMessageType ? _self.lastMessageType : lastMessageType // ignore: cast_nullable_to_non_nullable
as String?,lastMessageSenderId: freezed == lastMessageSenderId ? _self.lastMessageSenderId : lastMessageSenderId // ignore: cast_nullable_to_non_nullable
as String?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,otherUserId: freezed == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String?,otherUsername: freezed == otherUsername ? _self.otherUsername : otherUsername // ignore: cast_nullable_to_non_nullable
as String?,otherAvatarUrl: freezed == otherAvatarUrl ? _self.otherAvatarUrl : otherAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,otherFullName: freezed == otherFullName ? _self.otherFullName : otherFullName // ignore: cast_nullable_to_non_nullable
as String?,otherIsOnline: null == otherIsOnline ? _self.otherIsOnline : otherIsOnline // ignore: cast_nullable_to_non_nullable
as bool,otherLastSeen: freezed == otherLastSeen ? _self.otherLastSeen : otherLastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as String,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,scrollOffset: null == scrollOffset ? _self.scrollOffset : scrollOffset // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
