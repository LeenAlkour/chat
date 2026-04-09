// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationModel {

 String get id; String get type; String get lastMessageAt; String get createdAt; String? get lastMessageContent; String? get lastMessageType; String? get lastMessageSenderId; int get unreadCount; String? get otherUserId; String? get otherUsername; String? get otherAvatarUrl; String? get otherFullName; int get otherIsOnline; String? get otherLastSeen; String get draft; int get isMuted; double get scrollOffset;
/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationModelCopyWith<ConversationModel> get copyWith => _$ConversationModelCopyWithImpl<ConversationModel>(this as ConversationModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastMessageContent, lastMessageContent) || other.lastMessageContent == lastMessageContent)&&(identical(other.lastMessageType, lastMessageType) || other.lastMessageType == lastMessageType)&&(identical(other.lastMessageSenderId, lastMessageSenderId) || other.lastMessageSenderId == lastMessageSenderId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&(identical(other.otherUsername, otherUsername) || other.otherUsername == otherUsername)&&(identical(other.otherAvatarUrl, otherAvatarUrl) || other.otherAvatarUrl == otherAvatarUrl)&&(identical(other.otherFullName, otherFullName) || other.otherFullName == otherFullName)&&(identical(other.otherIsOnline, otherIsOnline) || other.otherIsOnline == otherIsOnline)&&(identical(other.otherLastSeen, otherLastSeen) || other.otherLastSeen == otherLastSeen)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.scrollOffset, scrollOffset) || other.scrollOffset == scrollOffset));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,lastMessageAt,createdAt,lastMessageContent,lastMessageType,lastMessageSenderId,unreadCount,otherUserId,otherUsername,otherAvatarUrl,otherFullName,otherIsOnline,otherLastSeen,draft,isMuted,scrollOffset);

@override
String toString() {
  return 'ConversationModel(id: $id, type: $type, lastMessageAt: $lastMessageAt, createdAt: $createdAt, lastMessageContent: $lastMessageContent, lastMessageType: $lastMessageType, lastMessageSenderId: $lastMessageSenderId, unreadCount: $unreadCount, otherUserId: $otherUserId, otherUsername: $otherUsername, otherAvatarUrl: $otherAvatarUrl, otherFullName: $otherFullName, otherIsOnline: $otherIsOnline, otherLastSeen: $otherLastSeen, draft: $draft, isMuted: $isMuted, scrollOffset: $scrollOffset)';
}


}

/// @nodoc
abstract mixin class $ConversationModelCopyWith<$Res>  {
  factory $ConversationModelCopyWith(ConversationModel value, $Res Function(ConversationModel) _then) = _$ConversationModelCopyWithImpl;
@useResult
$Res call({
 String id, String type, String lastMessageAt, String createdAt, String? lastMessageContent, String? lastMessageType, String? lastMessageSenderId, int unreadCount, String? otherUserId, String? otherUsername, String? otherAvatarUrl, String? otherFullName, int otherIsOnline, String? otherLastSeen, String draft, int isMuted, double scrollOffset
});




}
/// @nodoc
class _$ConversationModelCopyWithImpl<$Res>
    implements $ConversationModelCopyWith<$Res> {
  _$ConversationModelCopyWithImpl(this._self, this._then);

  final ConversationModel _self;
  final $Res Function(ConversationModel) _then;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? lastMessageAt = null,Object? createdAt = null,Object? lastMessageContent = freezed,Object? lastMessageType = freezed,Object? lastMessageSenderId = freezed,Object? unreadCount = null,Object? otherUserId = freezed,Object? otherUsername = freezed,Object? otherAvatarUrl = freezed,Object? otherFullName = freezed,Object? otherIsOnline = null,Object? otherLastSeen = freezed,Object? draft = null,Object? isMuted = null,Object? scrollOffset = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,lastMessageContent: freezed == lastMessageContent ? _self.lastMessageContent : lastMessageContent // ignore: cast_nullable_to_non_nullable
as String?,lastMessageType: freezed == lastMessageType ? _self.lastMessageType : lastMessageType // ignore: cast_nullable_to_non_nullable
as String?,lastMessageSenderId: freezed == lastMessageSenderId ? _self.lastMessageSenderId : lastMessageSenderId // ignore: cast_nullable_to_non_nullable
as String?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,otherUserId: freezed == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String?,otherUsername: freezed == otherUsername ? _self.otherUsername : otherUsername // ignore: cast_nullable_to_non_nullable
as String?,otherAvatarUrl: freezed == otherAvatarUrl ? _self.otherAvatarUrl : otherAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,otherFullName: freezed == otherFullName ? _self.otherFullName : otherFullName // ignore: cast_nullable_to_non_nullable
as String?,otherIsOnline: null == otherIsOnline ? _self.otherIsOnline : otherIsOnline // ignore: cast_nullable_to_non_nullable
as int,otherLastSeen: freezed == otherLastSeen ? _self.otherLastSeen : otherLastSeen // ignore: cast_nullable_to_non_nullable
as String?,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as String,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as int,scrollOffset: null == scrollOffset ? _self.scrollOffset : scrollOffset // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationModel].
extension ConversationModelPatterns on ConversationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationModel value)  $default,){
final _that = this;
switch (_that) {
case _ConversationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String lastMessageAt,  String createdAt,  String? lastMessageContent,  String? lastMessageType,  String? lastMessageSenderId,  int unreadCount,  String? otherUserId,  String? otherUsername,  String? otherAvatarUrl,  String? otherFullName,  int otherIsOnline,  String? otherLastSeen,  String draft,  int isMuted,  double scrollOffset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String lastMessageAt,  String createdAt,  String? lastMessageContent,  String? lastMessageType,  String? lastMessageSenderId,  int unreadCount,  String? otherUserId,  String? otherUsername,  String? otherAvatarUrl,  String? otherFullName,  int otherIsOnline,  String? otherLastSeen,  String draft,  int isMuted,  double scrollOffset)  $default,) {final _that = this;
switch (_that) {
case _ConversationModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String lastMessageAt,  String createdAt,  String? lastMessageContent,  String? lastMessageType,  String? lastMessageSenderId,  int unreadCount,  String? otherUserId,  String? otherUsername,  String? otherAvatarUrl,  String? otherFullName,  int otherIsOnline,  String? otherLastSeen,  String draft,  int isMuted,  double scrollOffset)?  $default,) {final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
return $default(_that.id,_that.type,_that.lastMessageAt,_that.createdAt,_that.lastMessageContent,_that.lastMessageType,_that.lastMessageSenderId,_that.unreadCount,_that.otherUserId,_that.otherUsername,_that.otherAvatarUrl,_that.otherFullName,_that.otherIsOnline,_that.otherLastSeen,_that.draft,_that.isMuted,_that.scrollOffset);case _:
  return null;

}
}

}

/// @nodoc


class _ConversationModel extends ConversationModel {
  const _ConversationModel({required this.id, required this.type, required this.lastMessageAt, required this.createdAt, this.lastMessageContent, this.lastMessageType, this.lastMessageSenderId, required this.unreadCount, this.otherUserId, this.otherUsername, this.otherAvatarUrl, this.otherFullName, required this.otherIsOnline, this.otherLastSeen, required this.draft, required this.isMuted, required this.scrollOffset}): super._();
  

@override final  String id;
@override final  String type;
@override final  String lastMessageAt;
@override final  String createdAt;
@override final  String? lastMessageContent;
@override final  String? lastMessageType;
@override final  String? lastMessageSenderId;
@override final  int unreadCount;
@override final  String? otherUserId;
@override final  String? otherUsername;
@override final  String? otherAvatarUrl;
@override final  String? otherFullName;
@override final  int otherIsOnline;
@override final  String? otherLastSeen;
@override final  String draft;
@override final  int isMuted;
@override final  double scrollOffset;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationModelCopyWith<_ConversationModel> get copyWith => __$ConversationModelCopyWithImpl<_ConversationModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastMessageContent, lastMessageContent) || other.lastMessageContent == lastMessageContent)&&(identical(other.lastMessageType, lastMessageType) || other.lastMessageType == lastMessageType)&&(identical(other.lastMessageSenderId, lastMessageSenderId) || other.lastMessageSenderId == lastMessageSenderId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&(identical(other.otherUsername, otherUsername) || other.otherUsername == otherUsername)&&(identical(other.otherAvatarUrl, otherAvatarUrl) || other.otherAvatarUrl == otherAvatarUrl)&&(identical(other.otherFullName, otherFullName) || other.otherFullName == otherFullName)&&(identical(other.otherIsOnline, otherIsOnline) || other.otherIsOnline == otherIsOnline)&&(identical(other.otherLastSeen, otherLastSeen) || other.otherLastSeen == otherLastSeen)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.scrollOffset, scrollOffset) || other.scrollOffset == scrollOffset));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,lastMessageAt,createdAt,lastMessageContent,lastMessageType,lastMessageSenderId,unreadCount,otherUserId,otherUsername,otherAvatarUrl,otherFullName,otherIsOnline,otherLastSeen,draft,isMuted,scrollOffset);

@override
String toString() {
  return 'ConversationModel(id: $id, type: $type, lastMessageAt: $lastMessageAt, createdAt: $createdAt, lastMessageContent: $lastMessageContent, lastMessageType: $lastMessageType, lastMessageSenderId: $lastMessageSenderId, unreadCount: $unreadCount, otherUserId: $otherUserId, otherUsername: $otherUsername, otherAvatarUrl: $otherAvatarUrl, otherFullName: $otherFullName, otherIsOnline: $otherIsOnline, otherLastSeen: $otherLastSeen, draft: $draft, isMuted: $isMuted, scrollOffset: $scrollOffset)';
}


}

/// @nodoc
abstract mixin class _$ConversationModelCopyWith<$Res> implements $ConversationModelCopyWith<$Res> {
  factory _$ConversationModelCopyWith(_ConversationModel value, $Res Function(_ConversationModel) _then) = __$ConversationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String lastMessageAt, String createdAt, String? lastMessageContent, String? lastMessageType, String? lastMessageSenderId, int unreadCount, String? otherUserId, String? otherUsername, String? otherAvatarUrl, String? otherFullName, int otherIsOnline, String? otherLastSeen, String draft, int isMuted, double scrollOffset
});




}
/// @nodoc
class __$ConversationModelCopyWithImpl<$Res>
    implements _$ConversationModelCopyWith<$Res> {
  __$ConversationModelCopyWithImpl(this._self, this._then);

  final _ConversationModel _self;
  final $Res Function(_ConversationModel) _then;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? lastMessageAt = null,Object? createdAt = null,Object? lastMessageContent = freezed,Object? lastMessageType = freezed,Object? lastMessageSenderId = freezed,Object? unreadCount = null,Object? otherUserId = freezed,Object? otherUsername = freezed,Object? otherAvatarUrl = freezed,Object? otherFullName = freezed,Object? otherIsOnline = null,Object? otherLastSeen = freezed,Object? draft = null,Object? isMuted = null,Object? scrollOffset = null,}) {
  return _then(_ConversationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,lastMessageContent: freezed == lastMessageContent ? _self.lastMessageContent : lastMessageContent // ignore: cast_nullable_to_non_nullable
as String?,lastMessageType: freezed == lastMessageType ? _self.lastMessageType : lastMessageType // ignore: cast_nullable_to_non_nullable
as String?,lastMessageSenderId: freezed == lastMessageSenderId ? _self.lastMessageSenderId : lastMessageSenderId // ignore: cast_nullable_to_non_nullable
as String?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,otherUserId: freezed == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String?,otherUsername: freezed == otherUsername ? _self.otherUsername : otherUsername // ignore: cast_nullable_to_non_nullable
as String?,otherAvatarUrl: freezed == otherAvatarUrl ? _self.otherAvatarUrl : otherAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,otherFullName: freezed == otherFullName ? _self.otherFullName : otherFullName // ignore: cast_nullable_to_non_nullable
as String?,otherIsOnline: null == otherIsOnline ? _self.otherIsOnline : otherIsOnline // ignore: cast_nullable_to_non_nullable
as int,otherLastSeen: freezed == otherLastSeen ? _self.otherLastSeen : otherLastSeen // ignore: cast_nullable_to_non_nullable
as String?,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as String,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as int,scrollOffset: null == scrollOffset ? _self.scrollOffset : scrollOffset // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
