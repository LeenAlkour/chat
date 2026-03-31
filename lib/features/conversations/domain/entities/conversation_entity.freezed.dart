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

 String get id; String get type;// 'direct' | 'group'
 DateTime get lastMessageAt; DateTime get createdAt; String? get lastMessageId; String? get lastMessageContent; String? get lastMessageType; List<ParticipantEntity> get participants; int get unreadCount;
/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationEntityCopyWith<ConversationEntity> get copyWith => _$ConversationEntityCopyWithImpl<ConversationEntity>(this as ConversationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastMessageId, lastMessageId) || other.lastMessageId == lastMessageId)&&(identical(other.lastMessageContent, lastMessageContent) || other.lastMessageContent == lastMessageContent)&&(identical(other.lastMessageType, lastMessageType) || other.lastMessageType == lastMessageType)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,lastMessageAt,createdAt,lastMessageId,lastMessageContent,lastMessageType,const DeepCollectionEquality().hash(participants),unreadCount);

@override
String toString() {
  return 'ConversationEntity(id: $id, type: $type, lastMessageAt: $lastMessageAt, createdAt: $createdAt, lastMessageId: $lastMessageId, lastMessageContent: $lastMessageContent, lastMessageType: $lastMessageType, participants: $participants, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $ConversationEntityCopyWith<$Res>  {
  factory $ConversationEntityCopyWith(ConversationEntity value, $Res Function(ConversationEntity) _then) = _$ConversationEntityCopyWithImpl;
@useResult
$Res call({
 String id, String type, DateTime lastMessageAt, DateTime createdAt, String? lastMessageId, String? lastMessageContent, String? lastMessageType, List<ParticipantEntity> participants, int unreadCount
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? lastMessageAt = null,Object? createdAt = null,Object? lastMessageId = freezed,Object? lastMessageContent = freezed,Object? lastMessageType = freezed,Object? participants = null,Object? unreadCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessageId: freezed == lastMessageId ? _self.lastMessageId : lastMessageId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageContent: freezed == lastMessageContent ? _self.lastMessageContent : lastMessageContent // ignore: cast_nullable_to_non_nullable
as String?,lastMessageType: freezed == lastMessageType ? _self.lastMessageType : lastMessageType // ignore: cast_nullable_to_non_nullable
as String?,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<ParticipantEntity>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  DateTime lastMessageAt,  DateTime createdAt,  String? lastMessageId,  String? lastMessageContent,  String? lastMessageType,  List<ParticipantEntity> participants,  int unreadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
return $default(_that.id,_that.type,_that.lastMessageAt,_that.createdAt,_that.lastMessageId,_that.lastMessageContent,_that.lastMessageType,_that.participants,_that.unreadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  DateTime lastMessageAt,  DateTime createdAt,  String? lastMessageId,  String? lastMessageContent,  String? lastMessageType,  List<ParticipantEntity> participants,  int unreadCount)  $default,) {final _that = this;
switch (_that) {
case _ConversationEntity():
return $default(_that.id,_that.type,_that.lastMessageAt,_that.createdAt,_that.lastMessageId,_that.lastMessageContent,_that.lastMessageType,_that.participants,_that.unreadCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  DateTime lastMessageAt,  DateTime createdAt,  String? lastMessageId,  String? lastMessageContent,  String? lastMessageType,  List<ParticipantEntity> participants,  int unreadCount)?  $default,) {final _that = this;
switch (_that) {
case _ConversationEntity() when $default != null:
return $default(_that.id,_that.type,_that.lastMessageAt,_that.createdAt,_that.lastMessageId,_that.lastMessageContent,_that.lastMessageType,_that.participants,_that.unreadCount);case _:
  return null;

}
}

}

/// @nodoc


class _ConversationEntity implements ConversationEntity {
  const _ConversationEntity({required this.id, required this.type, required this.lastMessageAt, required this.createdAt, this.lastMessageId, this.lastMessageContent, this.lastMessageType, required final  List<ParticipantEntity> participants, required this.unreadCount}): _participants = participants;
  

@override final  String id;
@override final  String type;
// 'direct' | 'group'
@override final  DateTime lastMessageAt;
@override final  DateTime createdAt;
@override final  String? lastMessageId;
@override final  String? lastMessageContent;
@override final  String? lastMessageType;
 final  List<ParticipantEntity> _participants;
@override List<ParticipantEntity> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override final  int unreadCount;

/// Create a copy of ConversationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationEntityCopyWith<_ConversationEntity> get copyWith => __$ConversationEntityCopyWithImpl<_ConversationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastMessageId, lastMessageId) || other.lastMessageId == lastMessageId)&&(identical(other.lastMessageContent, lastMessageContent) || other.lastMessageContent == lastMessageContent)&&(identical(other.lastMessageType, lastMessageType) || other.lastMessageType == lastMessageType)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,lastMessageAt,createdAt,lastMessageId,lastMessageContent,lastMessageType,const DeepCollectionEquality().hash(_participants),unreadCount);

@override
String toString() {
  return 'ConversationEntity(id: $id, type: $type, lastMessageAt: $lastMessageAt, createdAt: $createdAt, lastMessageId: $lastMessageId, lastMessageContent: $lastMessageContent, lastMessageType: $lastMessageType, participants: $participants, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$ConversationEntityCopyWith<$Res> implements $ConversationEntityCopyWith<$Res> {
  factory _$ConversationEntityCopyWith(_ConversationEntity value, $Res Function(_ConversationEntity) _then) = __$ConversationEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, DateTime lastMessageAt, DateTime createdAt, String? lastMessageId, String? lastMessageContent, String? lastMessageType, List<ParticipantEntity> participants, int unreadCount
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? lastMessageAt = null,Object? createdAt = null,Object? lastMessageId = freezed,Object? lastMessageContent = freezed,Object? lastMessageType = freezed,Object? participants = null,Object? unreadCount = null,}) {
  return _then(_ConversationEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessageId: freezed == lastMessageId ? _self.lastMessageId : lastMessageId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageContent: freezed == lastMessageContent ? _self.lastMessageContent : lastMessageContent // ignore: cast_nullable_to_non_nullable
as String?,lastMessageType: freezed == lastMessageType ? _self.lastMessageType : lastMessageType // ignore: cast_nullable_to_non_nullable
as String?,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<ParticipantEntity>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ParticipantEntity {

 String get userId; String get username; String? get avatarUrl; String? get fullName; bool get isOnline; DateTime get lastSeen; int get unreadCount;
/// Create a copy of ParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParticipantEntityCopyWith<ParticipantEntity> get copyWith => _$ParticipantEntityCopyWithImpl<ParticipantEntity>(this as ParticipantEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParticipantEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,userId,username,avatarUrl,fullName,isOnline,lastSeen,unreadCount);

@override
String toString() {
  return 'ParticipantEntity(userId: $userId, username: $username, avatarUrl: $avatarUrl, fullName: $fullName, isOnline: $isOnline, lastSeen: $lastSeen, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $ParticipantEntityCopyWith<$Res>  {
  factory $ParticipantEntityCopyWith(ParticipantEntity value, $Res Function(ParticipantEntity) _then) = _$ParticipantEntityCopyWithImpl;
@useResult
$Res call({
 String userId, String username, String? avatarUrl, String? fullName, bool isOnline, DateTime lastSeen, int unreadCount
});




}
/// @nodoc
class _$ParticipantEntityCopyWithImpl<$Res>
    implements $ParticipantEntityCopyWith<$Res> {
  _$ParticipantEntityCopyWithImpl(this._self, this._then);

  final ParticipantEntity _self;
  final $Res Function(ParticipantEntity) _then;

/// Create a copy of ParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? username = null,Object? avatarUrl = freezed,Object? fullName = freezed,Object? isOnline = null,Object? lastSeen = null,Object? unreadCount = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ParticipantEntity].
extension ParticipantEntityPatterns on ParticipantEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParticipantEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParticipantEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParticipantEntity value)  $default,){
final _that = this;
switch (_that) {
case _ParticipantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParticipantEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ParticipantEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String username,  String? avatarUrl,  String? fullName,  bool isOnline,  DateTime lastSeen,  int unreadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParticipantEntity() when $default != null:
return $default(_that.userId,_that.username,_that.avatarUrl,_that.fullName,_that.isOnline,_that.lastSeen,_that.unreadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String username,  String? avatarUrl,  String? fullName,  bool isOnline,  DateTime lastSeen,  int unreadCount)  $default,) {final _that = this;
switch (_that) {
case _ParticipantEntity():
return $default(_that.userId,_that.username,_that.avatarUrl,_that.fullName,_that.isOnline,_that.lastSeen,_that.unreadCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String username,  String? avatarUrl,  String? fullName,  bool isOnline,  DateTime lastSeen,  int unreadCount)?  $default,) {final _that = this;
switch (_that) {
case _ParticipantEntity() when $default != null:
return $default(_that.userId,_that.username,_that.avatarUrl,_that.fullName,_that.isOnline,_that.lastSeen,_that.unreadCount);case _:
  return null;

}
}

}

/// @nodoc


class _ParticipantEntity implements ParticipantEntity {
  const _ParticipantEntity({required this.userId, required this.username, this.avatarUrl, this.fullName, required this.isOnline, required this.lastSeen, required this.unreadCount});
  

@override final  String userId;
@override final  String username;
@override final  String? avatarUrl;
@override final  String? fullName;
@override final  bool isOnline;
@override final  DateTime lastSeen;
@override final  int unreadCount;

/// Create a copy of ParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParticipantEntityCopyWith<_ParticipantEntity> get copyWith => __$ParticipantEntityCopyWithImpl<_ParticipantEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParticipantEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,userId,username,avatarUrl,fullName,isOnline,lastSeen,unreadCount);

@override
String toString() {
  return 'ParticipantEntity(userId: $userId, username: $username, avatarUrl: $avatarUrl, fullName: $fullName, isOnline: $isOnline, lastSeen: $lastSeen, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$ParticipantEntityCopyWith<$Res> implements $ParticipantEntityCopyWith<$Res> {
  factory _$ParticipantEntityCopyWith(_ParticipantEntity value, $Res Function(_ParticipantEntity) _then) = __$ParticipantEntityCopyWithImpl;
@override @useResult
$Res call({
 String userId, String username, String? avatarUrl, String? fullName, bool isOnline, DateTime lastSeen, int unreadCount
});




}
/// @nodoc
class __$ParticipantEntityCopyWithImpl<$Res>
    implements _$ParticipantEntityCopyWith<$Res> {
  __$ParticipantEntityCopyWithImpl(this._self, this._then);

  final _ParticipantEntity _self;
  final $Res Function(_ParticipantEntity) _then;

/// Create a copy of ParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? username = null,Object? avatarUrl = freezed,Object? fullName = freezed,Object? isOnline = null,Object? lastSeen = null,Object? unreadCount = null,}) {
  return _then(_ParticipantEntity(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
