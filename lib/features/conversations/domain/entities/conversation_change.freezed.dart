// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_change.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationChange {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationChange);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationChange()';
}


}

/// @nodoc
class $ConversationChangeCopyWith<$Res>  {
$ConversationChangeCopyWith(ConversationChange _, $Res Function(ConversationChange) __);
}


/// Adds pattern-matching-related methods to [ConversationChange].
extension ConversationChangePatterns on ConversationChange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NewMessage value)?  newMessage,TResult Function( _UnreadCountChanged value)?  unreadCountChanged,TResult Function( _UserPresenceChanged value)?  userPresenceChanged,TResult Function( _ConversationAdded value)?  conversationAdded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewMessage() when newMessage != null:
return newMessage(_that);case _UnreadCountChanged() when unreadCountChanged != null:
return unreadCountChanged(_that);case _UserPresenceChanged() when userPresenceChanged != null:
return userPresenceChanged(_that);case _ConversationAdded() when conversationAdded != null:
return conversationAdded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NewMessage value)  newMessage,required TResult Function( _UnreadCountChanged value)  unreadCountChanged,required TResult Function( _UserPresenceChanged value)  userPresenceChanged,required TResult Function( _ConversationAdded value)  conversationAdded,}){
final _that = this;
switch (_that) {
case _NewMessage():
return newMessage(_that);case _UnreadCountChanged():
return unreadCountChanged(_that);case _UserPresenceChanged():
return userPresenceChanged(_that);case _ConversationAdded():
return conversationAdded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NewMessage value)?  newMessage,TResult? Function( _UnreadCountChanged value)?  unreadCountChanged,TResult? Function( _UserPresenceChanged value)?  userPresenceChanged,TResult? Function( _ConversationAdded value)?  conversationAdded,}){
final _that = this;
switch (_that) {
case _NewMessage() when newMessage != null:
return newMessage(_that);case _UnreadCountChanged() when unreadCountChanged != null:
return unreadCountChanged(_that);case _UserPresenceChanged() when userPresenceChanged != null:
return userPresenceChanged(_that);case _ConversationAdded() when conversationAdded != null:
return conversationAdded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String conversationId,  String content,  String messageType,  DateTime sentAt,  String senderId)?  newMessage,TResult Function( String conversationId,  int unreadCount)?  unreadCountChanged,TResult Function( String userId,  bool isOnline,  DateTime lastSeen)?  userPresenceChanged,TResult Function( ConversationModel conversation)?  conversationAdded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewMessage() when newMessage != null:
return newMessage(_that.conversationId,_that.content,_that.messageType,_that.sentAt,_that.senderId);case _UnreadCountChanged() when unreadCountChanged != null:
return unreadCountChanged(_that.conversationId,_that.unreadCount);case _UserPresenceChanged() when userPresenceChanged != null:
return userPresenceChanged(_that.userId,_that.isOnline,_that.lastSeen);case _ConversationAdded() when conversationAdded != null:
return conversationAdded(_that.conversation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String conversationId,  String content,  String messageType,  DateTime sentAt,  String senderId)  newMessage,required TResult Function( String conversationId,  int unreadCount)  unreadCountChanged,required TResult Function( String userId,  bool isOnline,  DateTime lastSeen)  userPresenceChanged,required TResult Function( ConversationModel conversation)  conversationAdded,}) {final _that = this;
switch (_that) {
case _NewMessage():
return newMessage(_that.conversationId,_that.content,_that.messageType,_that.sentAt,_that.senderId);case _UnreadCountChanged():
return unreadCountChanged(_that.conversationId,_that.unreadCount);case _UserPresenceChanged():
return userPresenceChanged(_that.userId,_that.isOnline,_that.lastSeen);case _ConversationAdded():
return conversationAdded(_that.conversation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String conversationId,  String content,  String messageType,  DateTime sentAt,  String senderId)?  newMessage,TResult? Function( String conversationId,  int unreadCount)?  unreadCountChanged,TResult? Function( String userId,  bool isOnline,  DateTime lastSeen)?  userPresenceChanged,TResult? Function( ConversationModel conversation)?  conversationAdded,}) {final _that = this;
switch (_that) {
case _NewMessage() when newMessage != null:
return newMessage(_that.conversationId,_that.content,_that.messageType,_that.sentAt,_that.senderId);case _UnreadCountChanged() when unreadCountChanged != null:
return unreadCountChanged(_that.conversationId,_that.unreadCount);case _UserPresenceChanged() when userPresenceChanged != null:
return userPresenceChanged(_that.userId,_that.isOnline,_that.lastSeen);case _ConversationAdded() when conversationAdded != null:
return conversationAdded(_that.conversation);case _:
  return null;

}
}

}

/// @nodoc


class _NewMessage implements ConversationChange {
  const _NewMessage({required this.conversationId, required this.content, required this.messageType, required this.sentAt, required this.senderId});
  

 final  String conversationId;
 final  String content;
 final  String messageType;
 final  DateTime sentAt;
 final  String senderId;

/// Create a copy of ConversationChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewMessageCopyWith<_NewMessage> get copyWith => __$NewMessageCopyWithImpl<_NewMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewMessage&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.content, content) || other.content == content)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.senderId, senderId) || other.senderId == senderId));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,content,messageType,sentAt,senderId);

@override
String toString() {
  return 'ConversationChange.newMessage(conversationId: $conversationId, content: $content, messageType: $messageType, sentAt: $sentAt, senderId: $senderId)';
}


}

/// @nodoc
abstract mixin class _$NewMessageCopyWith<$Res> implements $ConversationChangeCopyWith<$Res> {
  factory _$NewMessageCopyWith(_NewMessage value, $Res Function(_NewMessage) _then) = __$NewMessageCopyWithImpl;
@useResult
$Res call({
 String conversationId, String content, String messageType, DateTime sentAt, String senderId
});




}
/// @nodoc
class __$NewMessageCopyWithImpl<$Res>
    implements _$NewMessageCopyWith<$Res> {
  __$NewMessageCopyWithImpl(this._self, this._then);

  final _NewMessage _self;
  final $Res Function(_NewMessage) _then;

/// Create a copy of ConversationChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? content = null,Object? messageType = null,Object? sentAt = null,Object? senderId = null,}) {
  return _then(_NewMessage(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,messageType: null == messageType ? _self.messageType : messageType // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UnreadCountChanged implements ConversationChange {
  const _UnreadCountChanged({required this.conversationId, required this.unreadCount});
  

 final  String conversationId;
 final  int unreadCount;

/// Create a copy of ConversationChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnreadCountChangedCopyWith<_UnreadCountChanged> get copyWith => __$UnreadCountChangedCopyWithImpl<_UnreadCountChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnreadCountChanged&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,unreadCount);

@override
String toString() {
  return 'ConversationChange.unreadCountChanged(conversationId: $conversationId, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$UnreadCountChangedCopyWith<$Res> implements $ConversationChangeCopyWith<$Res> {
  factory _$UnreadCountChangedCopyWith(_UnreadCountChanged value, $Res Function(_UnreadCountChanged) _then) = __$UnreadCountChangedCopyWithImpl;
@useResult
$Res call({
 String conversationId, int unreadCount
});




}
/// @nodoc
class __$UnreadCountChangedCopyWithImpl<$Res>
    implements _$UnreadCountChangedCopyWith<$Res> {
  __$UnreadCountChangedCopyWithImpl(this._self, this._then);

  final _UnreadCountChanged _self;
  final $Res Function(_UnreadCountChanged) _then;

/// Create a copy of ConversationChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? unreadCount = null,}) {
  return _then(_UnreadCountChanged(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UserPresenceChanged implements ConversationChange {
  const _UserPresenceChanged({required this.userId, required this.isOnline, required this.lastSeen});
  

 final  String userId;
 final  bool isOnline;
 final  DateTime lastSeen;

/// Create a copy of ConversationChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPresenceChangedCopyWith<_UserPresenceChanged> get copyWith => __$UserPresenceChangedCopyWithImpl<_UserPresenceChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPresenceChanged&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen));
}


@override
int get hashCode => Object.hash(runtimeType,userId,isOnline,lastSeen);

@override
String toString() {
  return 'ConversationChange.userPresenceChanged(userId: $userId, isOnline: $isOnline, lastSeen: $lastSeen)';
}


}

/// @nodoc
abstract mixin class _$UserPresenceChangedCopyWith<$Res> implements $ConversationChangeCopyWith<$Res> {
  factory _$UserPresenceChangedCopyWith(_UserPresenceChanged value, $Res Function(_UserPresenceChanged) _then) = __$UserPresenceChangedCopyWithImpl;
@useResult
$Res call({
 String userId, bool isOnline, DateTime lastSeen
});




}
/// @nodoc
class __$UserPresenceChangedCopyWithImpl<$Res>
    implements _$UserPresenceChangedCopyWith<$Res> {
  __$UserPresenceChangedCopyWithImpl(this._self, this._then);

  final _UserPresenceChanged _self;
  final $Res Function(_UserPresenceChanged) _then;

/// Create a copy of ConversationChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? isOnline = null,Object? lastSeen = null,}) {
  return _then(_UserPresenceChanged(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _ConversationAdded implements ConversationChange {
  const _ConversationAdded(this.conversation);
  

 final  ConversationModel conversation;

/// Create a copy of ConversationChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationAddedCopyWith<_ConversationAdded> get copyWith => __$ConversationAddedCopyWithImpl<_ConversationAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationAdded&&(identical(other.conversation, conversation) || other.conversation == conversation));
}


@override
int get hashCode => Object.hash(runtimeType,conversation);

@override
String toString() {
  return 'ConversationChange.conversationAdded(conversation: $conversation)';
}


}

/// @nodoc
abstract mixin class _$ConversationAddedCopyWith<$Res> implements $ConversationChangeCopyWith<$Res> {
  factory _$ConversationAddedCopyWith(_ConversationAdded value, $Res Function(_ConversationAdded) _then) = __$ConversationAddedCopyWithImpl;
@useResult
$Res call({
 ConversationModel conversation
});


$ConversationModelCopyWith<$Res> get conversation;

}
/// @nodoc
class __$ConversationAddedCopyWithImpl<$Res>
    implements _$ConversationAddedCopyWith<$Res> {
  __$ConversationAddedCopyWithImpl(this._self, this._then);

  final _ConversationAdded _self;
  final $Res Function(_ConversationAdded) _then;

/// Create a copy of ConversationChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversation = null,}) {
  return _then(_ConversationAdded(
null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as ConversationModel,
  ));
}

/// Create a copy of ConversationChange
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConversationModelCopyWith<$Res> get conversation {
  
  return $ConversationModelCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}

// dart format on
