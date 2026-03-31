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

 String get id; String get type;@JsonKey(name: 'last_message_at') String get lastMessageAt;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'last_message_id') String? get lastMessageId;// من join مع messages
@JsonKey(name: 'last_message_content') String? get lastMessageContent;@JsonKey(name: 'last_message_type') String? get lastMessageType;@JsonKey(name: 'conversation_participants') List<ParticipantModel> get participants;
/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationModelCopyWith<ConversationModel> get copyWith => _$ConversationModelCopyWithImpl<ConversationModel>(this as ConversationModel, _$identity);

  /// Serializes this ConversationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastMessageId, lastMessageId) || other.lastMessageId == lastMessageId)&&(identical(other.lastMessageContent, lastMessageContent) || other.lastMessageContent == lastMessageContent)&&(identical(other.lastMessageType, lastMessageType) || other.lastMessageType == lastMessageType)&&const DeepCollectionEquality().equals(other.participants, participants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,lastMessageAt,createdAt,lastMessageId,lastMessageContent,lastMessageType,const DeepCollectionEquality().hash(participants));

@override
String toString() {
  return 'ConversationModel(id: $id, type: $type, lastMessageAt: $lastMessageAt, createdAt: $createdAt, lastMessageId: $lastMessageId, lastMessageContent: $lastMessageContent, lastMessageType: $lastMessageType, participants: $participants)';
}


}

/// @nodoc
abstract mixin class $ConversationModelCopyWith<$Res>  {
  factory $ConversationModelCopyWith(ConversationModel value, $Res Function(ConversationModel) _then) = _$ConversationModelCopyWithImpl;
@useResult
$Res call({
 String id, String type,@JsonKey(name: 'last_message_at') String lastMessageAt,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'last_message_id') String? lastMessageId,@JsonKey(name: 'last_message_content') String? lastMessageContent,@JsonKey(name: 'last_message_type') String? lastMessageType,@JsonKey(name: 'conversation_participants') List<ParticipantModel> participants
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? lastMessageAt = null,Object? createdAt = null,Object? lastMessageId = freezed,Object? lastMessageContent = freezed,Object? lastMessageType = freezed,Object? participants = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,lastMessageId: freezed == lastMessageId ? _self.lastMessageId : lastMessageId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageContent: freezed == lastMessageContent ? _self.lastMessageContent : lastMessageContent // ignore: cast_nullable_to_non_nullable
as String?,lastMessageType: freezed == lastMessageType ? _self.lastMessageType : lastMessageType // ignore: cast_nullable_to_non_nullable
as String?,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<ParticipantModel>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type, @JsonKey(name: 'last_message_at')  String lastMessageAt, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'last_message_id')  String? lastMessageId, @JsonKey(name: 'last_message_content')  String? lastMessageContent, @JsonKey(name: 'last_message_type')  String? lastMessageType, @JsonKey(name: 'conversation_participants')  List<ParticipantModel> participants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
return $default(_that.id,_that.type,_that.lastMessageAt,_that.createdAt,_that.lastMessageId,_that.lastMessageContent,_that.lastMessageType,_that.participants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type, @JsonKey(name: 'last_message_at')  String lastMessageAt, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'last_message_id')  String? lastMessageId, @JsonKey(name: 'last_message_content')  String? lastMessageContent, @JsonKey(name: 'last_message_type')  String? lastMessageType, @JsonKey(name: 'conversation_participants')  List<ParticipantModel> participants)  $default,) {final _that = this;
switch (_that) {
case _ConversationModel():
return $default(_that.id,_that.type,_that.lastMessageAt,_that.createdAt,_that.lastMessageId,_that.lastMessageContent,_that.lastMessageType,_that.participants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type, @JsonKey(name: 'last_message_at')  String lastMessageAt, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'last_message_id')  String? lastMessageId, @JsonKey(name: 'last_message_content')  String? lastMessageContent, @JsonKey(name: 'last_message_type')  String? lastMessageType, @JsonKey(name: 'conversation_participants')  List<ParticipantModel> participants)?  $default,) {final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
return $default(_that.id,_that.type,_that.lastMessageAt,_that.createdAt,_that.lastMessageId,_that.lastMessageContent,_that.lastMessageType,_that.participants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationModel extends ConversationModel {
  const _ConversationModel({required this.id, required this.type, @JsonKey(name: 'last_message_at') required this.lastMessageAt, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'last_message_id') this.lastMessageId, @JsonKey(name: 'last_message_content') this.lastMessageContent, @JsonKey(name: 'last_message_type') this.lastMessageType, @JsonKey(name: 'conversation_participants') required final  List<ParticipantModel> participants}): _participants = participants,super._();
  factory _ConversationModel.fromJson(Map<String, dynamic> json) => _$ConversationModelFromJson(json);

@override final  String id;
@override final  String type;
@override@JsonKey(name: 'last_message_at') final  String lastMessageAt;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'last_message_id') final  String? lastMessageId;
// من join مع messages
@override@JsonKey(name: 'last_message_content') final  String? lastMessageContent;
@override@JsonKey(name: 'last_message_type') final  String? lastMessageType;
 final  List<ParticipantModel> _participants;
@override@JsonKey(name: 'conversation_participants') List<ParticipantModel> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}


/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationModelCopyWith<_ConversationModel> get copyWith => __$ConversationModelCopyWithImpl<_ConversationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastMessageId, lastMessageId) || other.lastMessageId == lastMessageId)&&(identical(other.lastMessageContent, lastMessageContent) || other.lastMessageContent == lastMessageContent)&&(identical(other.lastMessageType, lastMessageType) || other.lastMessageType == lastMessageType)&&const DeepCollectionEquality().equals(other._participants, _participants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,lastMessageAt,createdAt,lastMessageId,lastMessageContent,lastMessageType,const DeepCollectionEquality().hash(_participants));

@override
String toString() {
  return 'ConversationModel(id: $id, type: $type, lastMessageAt: $lastMessageAt, createdAt: $createdAt, lastMessageId: $lastMessageId, lastMessageContent: $lastMessageContent, lastMessageType: $lastMessageType, participants: $participants)';
}


}

/// @nodoc
abstract mixin class _$ConversationModelCopyWith<$Res> implements $ConversationModelCopyWith<$Res> {
  factory _$ConversationModelCopyWith(_ConversationModel value, $Res Function(_ConversationModel) _then) = __$ConversationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String type,@JsonKey(name: 'last_message_at') String lastMessageAt,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'last_message_id') String? lastMessageId,@JsonKey(name: 'last_message_content') String? lastMessageContent,@JsonKey(name: 'last_message_type') String? lastMessageType,@JsonKey(name: 'conversation_participants') List<ParticipantModel> participants
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? lastMessageAt = null,Object? createdAt = null,Object? lastMessageId = freezed,Object? lastMessageContent = freezed,Object? lastMessageType = freezed,Object? participants = null,}) {
  return _then(_ConversationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,lastMessageId: freezed == lastMessageId ? _self.lastMessageId : lastMessageId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageContent: freezed == lastMessageContent ? _self.lastMessageContent : lastMessageContent // ignore: cast_nullable_to_non_nullable
as String?,lastMessageType: freezed == lastMessageType ? _self.lastMessageType : lastMessageType // ignore: cast_nullable_to_non_nullable
as String?,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<ParticipantModel>,
  ));
}


}


/// @nodoc
mixin _$ParticipantModel {

 String get id;@JsonKey(name: 'conversation_id') String get conversationId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'unread_count') int get unreadCount;@JsonKey(name: 'last_read_at') String get lastReadAt;@JsonKey(name: 'joined_at') String get joinedAt; UserModel? get user;
/// Create a copy of ParticipantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParticipantModelCopyWith<ParticipantModel> get copyWith => _$ParticipantModelCopyWithImpl<ParticipantModel>(this as ParticipantModel, _$identity);

  /// Serializes this ParticipantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParticipantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,userId,unreadCount,lastReadAt,joinedAt,user);

@override
String toString() {
  return 'ParticipantModel(id: $id, conversationId: $conversationId, userId: $userId, unreadCount: $unreadCount, lastReadAt: $lastReadAt, joinedAt: $joinedAt, user: $user)';
}


}

/// @nodoc
abstract mixin class $ParticipantModelCopyWith<$Res>  {
  factory $ParticipantModelCopyWith(ParticipantModel value, $Res Function(ParticipantModel) _then) = _$ParticipantModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'conversation_id') String conversationId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'unread_count') int unreadCount,@JsonKey(name: 'last_read_at') String lastReadAt,@JsonKey(name: 'joined_at') String joinedAt, UserModel? user
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$ParticipantModelCopyWithImpl<$Res>
    implements $ParticipantModelCopyWith<$Res> {
  _$ParticipantModelCopyWithImpl(this._self, this._then);

  final ParticipantModel _self;
  final $Res Function(ParticipantModel) _then;

/// Create a copy of ParticipantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? conversationId = null,Object? userId = null,Object? unreadCount = null,Object? lastReadAt = null,Object? joinedAt = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,lastReadAt: null == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of ParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ParticipantModel].
extension ParticipantModelPatterns on ParticipantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParticipantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParticipantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParticipantModel value)  $default,){
final _that = this;
switch (_that) {
case _ParticipantModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParticipantModel value)?  $default,){
final _that = this;
switch (_that) {
case _ParticipantModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'unread_count')  int unreadCount, @JsonKey(name: 'last_read_at')  String lastReadAt, @JsonKey(name: 'joined_at')  String joinedAt,  UserModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParticipantModel() when $default != null:
return $default(_that.id,_that.conversationId,_that.userId,_that.unreadCount,_that.lastReadAt,_that.joinedAt,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'unread_count')  int unreadCount, @JsonKey(name: 'last_read_at')  String lastReadAt, @JsonKey(name: 'joined_at')  String joinedAt,  UserModel? user)  $default,) {final _that = this;
switch (_that) {
case _ParticipantModel():
return $default(_that.id,_that.conversationId,_that.userId,_that.unreadCount,_that.lastReadAt,_that.joinedAt,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'unread_count')  int unreadCount, @JsonKey(name: 'last_read_at')  String lastReadAt, @JsonKey(name: 'joined_at')  String joinedAt,  UserModel? user)?  $default,) {final _that = this;
switch (_that) {
case _ParticipantModel() when $default != null:
return $default(_that.id,_that.conversationId,_that.userId,_that.unreadCount,_that.lastReadAt,_that.joinedAt,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParticipantModel extends ParticipantModel {
  const _ParticipantModel({required this.id, @JsonKey(name: 'conversation_id') required this.conversationId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'unread_count') required this.unreadCount, @JsonKey(name: 'last_read_at') required this.lastReadAt, @JsonKey(name: 'joined_at') required this.joinedAt, this.user}): super._();
  factory _ParticipantModel.fromJson(Map<String, dynamic> json) => _$ParticipantModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'conversation_id') final  String conversationId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'unread_count') final  int unreadCount;
@override@JsonKey(name: 'last_read_at') final  String lastReadAt;
@override@JsonKey(name: 'joined_at') final  String joinedAt;
@override final  UserModel? user;

/// Create a copy of ParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParticipantModelCopyWith<_ParticipantModel> get copyWith => __$ParticipantModelCopyWithImpl<_ParticipantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParticipantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParticipantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,userId,unreadCount,lastReadAt,joinedAt,user);

@override
String toString() {
  return 'ParticipantModel(id: $id, conversationId: $conversationId, userId: $userId, unreadCount: $unreadCount, lastReadAt: $lastReadAt, joinedAt: $joinedAt, user: $user)';
}


}

/// @nodoc
abstract mixin class _$ParticipantModelCopyWith<$Res> implements $ParticipantModelCopyWith<$Res> {
  factory _$ParticipantModelCopyWith(_ParticipantModel value, $Res Function(_ParticipantModel) _then) = __$ParticipantModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'conversation_id') String conversationId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'unread_count') int unreadCount,@JsonKey(name: 'last_read_at') String lastReadAt,@JsonKey(name: 'joined_at') String joinedAt, UserModel? user
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$ParticipantModelCopyWithImpl<$Res>
    implements _$ParticipantModelCopyWith<$Res> {
  __$ParticipantModelCopyWithImpl(this._self, this._then);

  final _ParticipantModel _self;
  final $Res Function(_ParticipantModel) _then;

/// Create a copy of ParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conversationId = null,Object? userId = null,Object? unreadCount = null,Object? lastReadAt = null,Object? joinedAt = null,Object? user = freezed,}) {
  return _then(_ParticipantModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,lastReadAt: null == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of ParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$UserModel {

 String get id; String get username; String? get email;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'full_name') String? get fullName;@JsonKey(name: 'is_online') bool get isOnline;@JsonKey(name: 'last_seen') String get lastSeen;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email,avatarUrl,fullName,isOnline,lastSeen);

@override
String toString() {
  return 'UserModel(id: $id, username: $username, email: $email, avatarUrl: $avatarUrl, fullName: $fullName, isOnline: $isOnline, lastSeen: $lastSeen)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String username, String? email,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'is_online') bool isOnline,@JsonKey(name: 'last_seen') String lastSeen
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? email = freezed,Object? avatarUrl = freezed,Object? fullName = freezed,Object? isOnline = null,Object? lastSeen = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String? email, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'is_online')  bool isOnline, @JsonKey(name: 'last_seen')  String lastSeen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.username,_that.email,_that.avatarUrl,_that.fullName,_that.isOnline,_that.lastSeen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String? email, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'is_online')  bool isOnline, @JsonKey(name: 'last_seen')  String lastSeen)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.username,_that.email,_that.avatarUrl,_that.fullName,_that.isOnline,_that.lastSeen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String? email, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'is_online')  bool isOnline, @JsonKey(name: 'last_seen')  String lastSeen)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.username,_that.email,_that.avatarUrl,_that.fullName,_that.isOnline,_that.lastSeen);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({required this.id, required this.username, this.email, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'full_name') this.fullName, @JsonKey(name: 'is_online') this.isOnline = false, @JsonKey(name: 'last_seen') required this.lastSeen});
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String id;
@override final  String username;
@override final  String? email;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'full_name') final  String? fullName;
@override@JsonKey(name: 'is_online') final  bool isOnline;
@override@JsonKey(name: 'last_seen') final  String lastSeen;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email,avatarUrl,fullName,isOnline,lastSeen);

@override
String toString() {
  return 'UserModel(id: $id, username: $username, email: $email, avatarUrl: $avatarUrl, fullName: $fullName, isOnline: $isOnline, lastSeen: $lastSeen)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String? email,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'is_online') bool isOnline,@JsonKey(name: 'last_seen') String lastSeen
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? email = freezed,Object? avatarUrl = freezed,Object? fullName = freezed,Object? isOnline = null,Object? lastSeen = null,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
