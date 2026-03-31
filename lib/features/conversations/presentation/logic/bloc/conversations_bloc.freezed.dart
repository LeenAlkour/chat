// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsEvent()';
}


}

/// @nodoc
class $ConversationsEventCopyWith<$Res>  {
$ConversationsEventCopyWith(ConversationsEvent _, $Res Function(ConversationsEvent) __);
}


/// Adds pattern-matching-related methods to [ConversationsEvent].
extension ConversationsEventPatterns on ConversationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadConversations value)?  loadConversations,TResult Function( _RefreshConversations value)?  refreshConversations,TResult Function( _StartWatching value)?  startWatching,TResult Function( _ConversationAdded value)?  conversationAdded,TResult Function( _NewMessageReceived value)?  newMessageReceived,TResult Function( _UnreadCountChanged value)?  unreadCountChanged,TResult Function( _UserPresenceChanged value)?  userPresenceChanged,TResult Function( _WatchError value)?  watchError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadConversations() when loadConversations != null:
return loadConversations(_that);case _RefreshConversations() when refreshConversations != null:
return refreshConversations(_that);case _StartWatching() when startWatching != null:
return startWatching(_that);case _ConversationAdded() when conversationAdded != null:
return conversationAdded(_that);case _NewMessageReceived() when newMessageReceived != null:
return newMessageReceived(_that);case _UnreadCountChanged() when unreadCountChanged != null:
return unreadCountChanged(_that);case _UserPresenceChanged() when userPresenceChanged != null:
return userPresenceChanged(_that);case _WatchError() when watchError != null:
return watchError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadConversations value)  loadConversations,required TResult Function( _RefreshConversations value)  refreshConversations,required TResult Function( _StartWatching value)  startWatching,required TResult Function( _ConversationAdded value)  conversationAdded,required TResult Function( _NewMessageReceived value)  newMessageReceived,required TResult Function( _UnreadCountChanged value)  unreadCountChanged,required TResult Function( _UserPresenceChanged value)  userPresenceChanged,required TResult Function( _WatchError value)  watchError,}){
final _that = this;
switch (_that) {
case _LoadConversations():
return loadConversations(_that);case _RefreshConversations():
return refreshConversations(_that);case _StartWatching():
return startWatching(_that);case _ConversationAdded():
return conversationAdded(_that);case _NewMessageReceived():
return newMessageReceived(_that);case _UnreadCountChanged():
return unreadCountChanged(_that);case _UserPresenceChanged():
return userPresenceChanged(_that);case _WatchError():
return watchError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadConversations value)?  loadConversations,TResult? Function( _RefreshConversations value)?  refreshConversations,TResult? Function( _StartWatching value)?  startWatching,TResult? Function( _ConversationAdded value)?  conversationAdded,TResult? Function( _NewMessageReceived value)?  newMessageReceived,TResult? Function( _UnreadCountChanged value)?  unreadCountChanged,TResult? Function( _UserPresenceChanged value)?  userPresenceChanged,TResult? Function( _WatchError value)?  watchError,}){
final _that = this;
switch (_that) {
case _LoadConversations() when loadConversations != null:
return loadConversations(_that);case _RefreshConversations() when refreshConversations != null:
return refreshConversations(_that);case _StartWatching() when startWatching != null:
return startWatching(_that);case _ConversationAdded() when conversationAdded != null:
return conversationAdded(_that);case _NewMessageReceived() when newMessageReceived != null:
return newMessageReceived(_that);case _UnreadCountChanged() when unreadCountChanged != null:
return unreadCountChanged(_that);case _UserPresenceChanged() when userPresenceChanged != null:
return userPresenceChanged(_that);case _WatchError() when watchError != null:
return watchError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadConversations,TResult Function()?  refreshConversations,TResult Function()?  startWatching,TResult Function( ConversationEntity conversation)?  conversationAdded,TResult Function( String conversationId,  String content,  String messageType,  DateTime sentAt,  String senderId)?  newMessageReceived,TResult Function( String conversationId,  int unreadCount)?  unreadCountChanged,TResult Function( String userId,  bool isOnline,  DateTime lastSeen)?  userPresenceChanged,TResult Function( Failure failure)?  watchError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadConversations() when loadConversations != null:
return loadConversations();case _RefreshConversations() when refreshConversations != null:
return refreshConversations();case _StartWatching() when startWatching != null:
return startWatching();case _ConversationAdded() when conversationAdded != null:
return conversationAdded(_that.conversation);case _NewMessageReceived() when newMessageReceived != null:
return newMessageReceived(_that.conversationId,_that.content,_that.messageType,_that.sentAt,_that.senderId);case _UnreadCountChanged() when unreadCountChanged != null:
return unreadCountChanged(_that.conversationId,_that.unreadCount);case _UserPresenceChanged() when userPresenceChanged != null:
return userPresenceChanged(_that.userId,_that.isOnline,_that.lastSeen);case _WatchError() when watchError != null:
return watchError(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadConversations,required TResult Function()  refreshConversations,required TResult Function()  startWatching,required TResult Function( ConversationEntity conversation)  conversationAdded,required TResult Function( String conversationId,  String content,  String messageType,  DateTime sentAt,  String senderId)  newMessageReceived,required TResult Function( String conversationId,  int unreadCount)  unreadCountChanged,required TResult Function( String userId,  bool isOnline,  DateTime lastSeen)  userPresenceChanged,required TResult Function( Failure failure)  watchError,}) {final _that = this;
switch (_that) {
case _LoadConversations():
return loadConversations();case _RefreshConversations():
return refreshConversations();case _StartWatching():
return startWatching();case _ConversationAdded():
return conversationAdded(_that.conversation);case _NewMessageReceived():
return newMessageReceived(_that.conversationId,_that.content,_that.messageType,_that.sentAt,_that.senderId);case _UnreadCountChanged():
return unreadCountChanged(_that.conversationId,_that.unreadCount);case _UserPresenceChanged():
return userPresenceChanged(_that.userId,_that.isOnline,_that.lastSeen);case _WatchError():
return watchError(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadConversations,TResult? Function()?  refreshConversations,TResult? Function()?  startWatching,TResult? Function( ConversationEntity conversation)?  conversationAdded,TResult? Function( String conversationId,  String content,  String messageType,  DateTime sentAt,  String senderId)?  newMessageReceived,TResult? Function( String conversationId,  int unreadCount)?  unreadCountChanged,TResult? Function( String userId,  bool isOnline,  DateTime lastSeen)?  userPresenceChanged,TResult? Function( Failure failure)?  watchError,}) {final _that = this;
switch (_that) {
case _LoadConversations() when loadConversations != null:
return loadConversations();case _RefreshConversations() when refreshConversations != null:
return refreshConversations();case _StartWatching() when startWatching != null:
return startWatching();case _ConversationAdded() when conversationAdded != null:
return conversationAdded(_that.conversation);case _NewMessageReceived() when newMessageReceived != null:
return newMessageReceived(_that.conversationId,_that.content,_that.messageType,_that.sentAt,_that.senderId);case _UnreadCountChanged() when unreadCountChanged != null:
return unreadCountChanged(_that.conversationId,_that.unreadCount);case _UserPresenceChanged() when userPresenceChanged != null:
return userPresenceChanged(_that.userId,_that.isOnline,_that.lastSeen);case _WatchError() when watchError != null:
return watchError(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _LoadConversations implements ConversationsEvent {
  const _LoadConversations();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadConversations);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsEvent.loadConversations()';
}


}




/// @nodoc


class _RefreshConversations implements ConversationsEvent {
  const _RefreshConversations();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshConversations);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsEvent.refreshConversations()';
}


}




/// @nodoc


class _StartWatching implements ConversationsEvent {
  const _StartWatching();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartWatching);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsEvent.startWatching()';
}


}




/// @nodoc


class _ConversationAdded implements ConversationsEvent {
  const _ConversationAdded({required this.conversation});
  

 final  ConversationEntity conversation;

/// Create a copy of ConversationsEvent
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
  return 'ConversationsEvent.conversationAdded(conversation: $conversation)';
}


}

/// @nodoc
abstract mixin class _$ConversationAddedCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
  factory _$ConversationAddedCopyWith(_ConversationAdded value, $Res Function(_ConversationAdded) _then) = __$ConversationAddedCopyWithImpl;
@useResult
$Res call({
 ConversationEntity conversation
});


$ConversationEntityCopyWith<$Res> get conversation;

}
/// @nodoc
class __$ConversationAddedCopyWithImpl<$Res>
    implements _$ConversationAddedCopyWith<$Res> {
  __$ConversationAddedCopyWithImpl(this._self, this._then);

  final _ConversationAdded _self;
  final $Res Function(_ConversationAdded) _then;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversation = null,}) {
  return _then(_ConversationAdded(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as ConversationEntity,
  ));
}

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConversationEntityCopyWith<$Res> get conversation {
  
  return $ConversationEntityCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}

/// @nodoc


class _NewMessageReceived implements ConversationsEvent {
  const _NewMessageReceived({required this.conversationId, required this.content, required this.messageType, required this.sentAt, required this.senderId});
  

 final  String conversationId;
 final  String content;
 final  String messageType;
 final  DateTime sentAt;
 final  String senderId;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewMessageReceivedCopyWith<_NewMessageReceived> get copyWith => __$NewMessageReceivedCopyWithImpl<_NewMessageReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewMessageReceived&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.content, content) || other.content == content)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.senderId, senderId) || other.senderId == senderId));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,content,messageType,sentAt,senderId);

@override
String toString() {
  return 'ConversationsEvent.newMessageReceived(conversationId: $conversationId, content: $content, messageType: $messageType, sentAt: $sentAt, senderId: $senderId)';
}


}

/// @nodoc
abstract mixin class _$NewMessageReceivedCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
  factory _$NewMessageReceivedCopyWith(_NewMessageReceived value, $Res Function(_NewMessageReceived) _then) = __$NewMessageReceivedCopyWithImpl;
@useResult
$Res call({
 String conversationId, String content, String messageType, DateTime sentAt, String senderId
});




}
/// @nodoc
class __$NewMessageReceivedCopyWithImpl<$Res>
    implements _$NewMessageReceivedCopyWith<$Res> {
  __$NewMessageReceivedCopyWithImpl(this._self, this._then);

  final _NewMessageReceived _self;
  final $Res Function(_NewMessageReceived) _then;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? content = null,Object? messageType = null,Object? sentAt = null,Object? senderId = null,}) {
  return _then(_NewMessageReceived(
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


class _UnreadCountChanged implements ConversationsEvent {
  const _UnreadCountChanged({required this.conversationId, required this.unreadCount});
  

 final  String conversationId;
 final  int unreadCount;

/// Create a copy of ConversationsEvent
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
  return 'ConversationsEvent.unreadCountChanged(conversationId: $conversationId, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$UnreadCountChangedCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
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

/// Create a copy of ConversationsEvent
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


class _UserPresenceChanged implements ConversationsEvent {
  const _UserPresenceChanged({required this.userId, required this.isOnline, required this.lastSeen});
  

 final  String userId;
 final  bool isOnline;
 final  DateTime lastSeen;

/// Create a copy of ConversationsEvent
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
  return 'ConversationsEvent.userPresenceChanged(userId: $userId, isOnline: $isOnline, lastSeen: $lastSeen)';
}


}

/// @nodoc
abstract mixin class _$UserPresenceChangedCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
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

/// Create a copy of ConversationsEvent
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


class _WatchError implements ConversationsEvent {
  const _WatchError(this.failure);
  

 final  Failure failure;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchErrorCopyWith<_WatchError> get copyWith => __$WatchErrorCopyWithImpl<_WatchError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ConversationsEvent.watchError(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$WatchErrorCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
  factory _$WatchErrorCopyWith(_WatchError value, $Res Function(_WatchError) _then) = __$WatchErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$WatchErrorCopyWithImpl<$Res>
    implements _$WatchErrorCopyWith<$Res> {
  __$WatchErrorCopyWithImpl(this._self, this._then);

  final _WatchError _self;
  final $Res Function(_WatchError) _then;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_WatchError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc
mixin _$ConversationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsState()';
}


}

/// @nodoc
class $ConversationsStateCopyWith<$Res>  {
$ConversationsStateCopyWith(ConversationsState _, $Res Function(ConversationsState) __);
}


/// Adds pattern-matching-related methods to [ConversationsState].
extension ConversationsStatePatterns on ConversationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Failure value)?  failure,TResult Function( WatchFailure value)?  watchFailure,TResult Function( _Empty value)?  empty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Failure() when failure != null:
return failure(_that);case WatchFailure() when watchFailure != null:
return watchFailure(_that);case _Empty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Failure value)  failure,required TResult Function( WatchFailure value)  watchFailure,required TResult Function( _Empty value)  empty,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Failure():
return failure(_that);case WatchFailure():
return watchFailure(_that);case _Empty():
return empty(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Failure value)?  failure,TResult? Function( WatchFailure value)?  watchFailure,TResult? Function( _Empty value)?  empty,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Failure() when failure != null:
return failure(_that);case WatchFailure() when watchFailure != null:
return watchFailure(_that);case _Empty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ConversationEntity> conversations,  bool isRefreshing)?  loaded,TResult Function( Failure failure)?  failure,TResult Function( List<ConversationEntity> conversations,  Failure failure)?  watchFailure,TResult Function()?  empty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.conversations,_that.isRefreshing);case _Failure() when failure != null:
return failure(_that.failure);case WatchFailure() when watchFailure != null:
return watchFailure(_that.conversations,_that.failure);case _Empty() when empty != null:
return empty();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ConversationEntity> conversations,  bool isRefreshing)  loaded,required TResult Function( Failure failure)  failure,required TResult Function( List<ConversationEntity> conversations,  Failure failure)  watchFailure,required TResult Function()  empty,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.conversations,_that.isRefreshing);case _Failure():
return failure(_that.failure);case WatchFailure():
return watchFailure(_that.conversations,_that.failure);case _Empty():
return empty();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ConversationEntity> conversations,  bool isRefreshing)?  loaded,TResult? Function( Failure failure)?  failure,TResult? Function( List<ConversationEntity> conversations,  Failure failure)?  watchFailure,TResult? Function()?  empty,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.conversations,_that.isRefreshing);case _Failure() when failure != null:
return failure(_that.failure);case WatchFailure() when watchFailure != null:
return watchFailure(_that.conversations,_that.failure);case _Empty() when empty != null:
return empty();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ConversationsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsState.initial()';
}


}




/// @nodoc


class _Loading implements ConversationsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsState.loading()';
}


}




/// @nodoc


class _Loaded implements ConversationsState {
  const _Loaded({required final  List<ConversationEntity> conversations, this.isRefreshing = false}): _conversations = conversations;
  

 final  List<ConversationEntity> _conversations;
 List<ConversationEntity> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}

@JsonKey() final  bool isRefreshing;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._conversations, _conversations)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations),isRefreshing);

@override
String toString() {
  return 'ConversationsState.loaded(conversations: $conversations, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ConversationsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<ConversationEntity> conversations, bool isRefreshing
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversations = null,Object? isRefreshing = null,}) {
  return _then(_Loaded(
conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationEntity>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Failure implements ConversationsState {
  const _Failure({required this.failure});
  

 final  Failure failure;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ConversationsState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $ConversationsStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Failure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class WatchFailure implements ConversationsState {
  const WatchFailure({required final  List<ConversationEntity> conversations, required this.failure}): _conversations = conversations;
  

 final  List<ConversationEntity> _conversations;
 List<ConversationEntity> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}

 final  Failure failure;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchFailureCopyWith<WatchFailure> get copyWith => _$WatchFailureCopyWithImpl<WatchFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchFailure&&const DeepCollectionEquality().equals(other._conversations, _conversations)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations),failure);

@override
String toString() {
  return 'ConversationsState.watchFailure(conversations: $conversations, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $WatchFailureCopyWith<$Res> implements $ConversationsStateCopyWith<$Res> {
  factory $WatchFailureCopyWith(WatchFailure value, $Res Function(WatchFailure) _then) = _$WatchFailureCopyWithImpl;
@useResult
$Res call({
 List<ConversationEntity> conversations, Failure failure
});




}
/// @nodoc
class _$WatchFailureCopyWithImpl<$Res>
    implements $WatchFailureCopyWith<$Res> {
  _$WatchFailureCopyWithImpl(this._self, this._then);

  final WatchFailure _self;
  final $Res Function(WatchFailure) _then;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversations = null,Object? failure = null,}) {
  return _then(WatchFailure(
conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationEntity>,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class _Empty implements ConversationsState {
  const _Empty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Empty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsState.empty()';
}


}




// dart format on
