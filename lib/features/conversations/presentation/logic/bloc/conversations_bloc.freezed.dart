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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _Refresh value)?  refresh,TResult Function( _StartWatching value)?  startWatching,TResult Function( _Updated value)?  updated,TResult Function( _Error value)?  error,TResult Function( _SendMessage value)?  sendMessage,TResult Function( _MarkAsRead value)?  markAsRead,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Refresh() when refresh != null:
return refresh(_that);case _StartWatching() when startWatching != null:
return startWatching(_that);case _Updated() when updated != null:
return updated(_that);case _Error() when error != null:
return error(_that);case _SendMessage() when sendMessage != null:
return sendMessage(_that);case _MarkAsRead() when markAsRead != null:
return markAsRead(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _Refresh value)  refresh,required TResult Function( _StartWatching value)  startWatching,required TResult Function( _Updated value)  updated,required TResult Function( _Error value)  error,required TResult Function( _SendMessage value)  sendMessage,required TResult Function( _MarkAsRead value)  markAsRead,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _Refresh():
return refresh(_that);case _StartWatching():
return startWatching(_that);case _Updated():
return updated(_that);case _Error():
return error(_that);case _SendMessage():
return sendMessage(_that);case _MarkAsRead():
return markAsRead(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _Refresh value)?  refresh,TResult? Function( _StartWatching value)?  startWatching,TResult? Function( _Updated value)?  updated,TResult? Function( _Error value)?  error,TResult? Function( _SendMessage value)?  sendMessage,TResult? Function( _MarkAsRead value)?  markAsRead,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Refresh() when refresh != null:
return refresh(_that);case _StartWatching() when startWatching != null:
return startWatching(_that);case _Updated() when updated != null:
return updated(_that);case _Error() when error != null:
return error(_that);case _SendMessage() when sendMessage != null:
return sendMessage(_that);case _MarkAsRead() when markAsRead != null:
return markAsRead(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function()?  refresh,TResult Function()?  startWatching,TResult Function( List<ConversationEntity> conversations)?  updated,TResult Function( String message)?  error,TResult Function( String conversationId,  String content,  String messageType,  String? replyToId)?  sendMessage,TResult Function( String conversationId)?  markAsRead,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _Refresh() when refresh != null:
return refresh();case _StartWatching() when startWatching != null:
return startWatching();case _Updated() when updated != null:
return updated(_that.conversations);case _Error() when error != null:
return error(_that.message);case _SendMessage() when sendMessage != null:
return sendMessage(_that.conversationId,_that.content,_that.messageType,_that.replyToId);case _MarkAsRead() when markAsRead != null:
return markAsRead(_that.conversationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function()  refresh,required TResult Function()  startWatching,required TResult Function( List<ConversationEntity> conversations)  updated,required TResult Function( String message)  error,required TResult Function( String conversationId,  String content,  String messageType,  String? replyToId)  sendMessage,required TResult Function( String conversationId)  markAsRead,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _Refresh():
return refresh();case _StartWatching():
return startWatching();case _Updated():
return updated(_that.conversations);case _Error():
return error(_that.message);case _SendMessage():
return sendMessage(_that.conversationId,_that.content,_that.messageType,_that.replyToId);case _MarkAsRead():
return markAsRead(_that.conversationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function()?  refresh,TResult? Function()?  startWatching,TResult? Function( List<ConversationEntity> conversations)?  updated,TResult? Function( String message)?  error,TResult? Function( String conversationId,  String content,  String messageType,  String? replyToId)?  sendMessage,TResult? Function( String conversationId)?  markAsRead,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _Refresh() when refresh != null:
return refresh();case _StartWatching() when startWatching != null:
return startWatching();case _Updated() when updated != null:
return updated(_that.conversations);case _Error() when error != null:
return error(_that.message);case _SendMessage() when sendMessage != null:
return sendMessage(_that.conversationId,_that.content,_that.messageType,_that.replyToId);case _MarkAsRead() when markAsRead != null:
return markAsRead(_that.conversationId);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements ConversationsEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsEvent.load()';
}


}




/// @nodoc


class _Refresh implements ConversationsEvent {
  const _Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsEvent.refresh()';
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


class _Updated implements ConversationsEvent {
  const _Updated(final  List<ConversationEntity> conversations): _conversations = conversations;
  

 final  List<ConversationEntity> _conversations;
 List<ConversationEntity> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}


/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&const DeepCollectionEquality().equals(other._conversations, _conversations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations));

@override
String toString() {
  return 'ConversationsEvent.updated(conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 List<ConversationEntity> conversations
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversations = null,}) {
  return _then(_Updated(
null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationEntity>,
  ));
}


}

/// @nodoc


class _Error implements ConversationsEvent {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ConversationsEvent.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SendMessage implements ConversationsEvent {
  const _SendMessage({required this.conversationId, required this.content, this.messageType = 'text', this.replyToId});
  

 final  String conversationId;
 final  String content;
@JsonKey() final  String messageType;
 final  String? replyToId;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageCopyWith<_SendMessage> get copyWith => __$SendMessageCopyWithImpl<_SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessage&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.content, content) || other.content == content)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.replyToId, replyToId) || other.replyToId == replyToId));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,content,messageType,replyToId);

@override
String toString() {
  return 'ConversationsEvent.sendMessage(conversationId: $conversationId, content: $content, messageType: $messageType, replyToId: $replyToId)';
}


}

/// @nodoc
abstract mixin class _$SendMessageCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
  factory _$SendMessageCopyWith(_SendMessage value, $Res Function(_SendMessage) _then) = __$SendMessageCopyWithImpl;
@useResult
$Res call({
 String conversationId, String content, String messageType, String? replyToId
});




}
/// @nodoc
class __$SendMessageCopyWithImpl<$Res>
    implements _$SendMessageCopyWith<$Res> {
  __$SendMessageCopyWithImpl(this._self, this._then);

  final _SendMessage _self;
  final $Res Function(_SendMessage) _then;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? content = null,Object? messageType = null,Object? replyToId = freezed,}) {
  return _then(_SendMessage(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,messageType: null == messageType ? _self.messageType : messageType // ignore: cast_nullable_to_non_nullable
as String,replyToId: freezed == replyToId ? _self.replyToId : replyToId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _MarkAsRead implements ConversationsEvent {
  const _MarkAsRead(this.conversationId);
  

 final  String conversationId;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAsReadCopyWith<_MarkAsRead> get copyWith => __$MarkAsReadCopyWithImpl<_MarkAsRead>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAsRead&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'ConversationsEvent.markAsRead(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class _$MarkAsReadCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
  factory _$MarkAsReadCopyWith(_MarkAsRead value, $Res Function(_MarkAsRead) _then) = __$MarkAsReadCopyWithImpl;
@useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class __$MarkAsReadCopyWithImpl<$Res>
    implements _$MarkAsReadCopyWith<$Res> {
  __$MarkAsReadCopyWithImpl(this._self, this._then);

  final _MarkAsRead _self;
  final $Res Function(_MarkAsRead) _then;

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(_MarkAsRead(
null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Empty value)?  empty,TResult Function( Failure value)?  failure,TResult Function( WatchFailure value)?  watchFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Empty() when empty != null:
return empty(_that);case Failure() when failure != null:
return failure(_that);case WatchFailure() when watchFailure != null:
return watchFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Empty value)  empty,required TResult Function( Failure value)  failure,required TResult Function( WatchFailure value)  watchFailure,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Empty():
return empty(_that);case Failure():
return failure(_that);case WatchFailure():
return watchFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Empty value)?  empty,TResult? Function( Failure value)?  failure,TResult? Function( WatchFailure value)?  watchFailure,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Empty() when empty != null:
return empty(_that);case Failure() when failure != null:
return failure(_that);case WatchFailure() when watchFailure != null:
return watchFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ConversationEntity> conversations,  bool isRefreshing)?  loaded,TResult Function()?  empty,TResult Function( String failure)?  failure,TResult Function( List<ConversationEntity> conversations,  String failure)?  watchFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.conversations,_that.isRefreshing);case Empty() when empty != null:
return empty();case Failure() when failure != null:
return failure(_that.failure);case WatchFailure() when watchFailure != null:
return watchFailure(_that.conversations,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ConversationEntity> conversations,  bool isRefreshing)  loaded,required TResult Function()  empty,required TResult Function( String failure)  failure,required TResult Function( List<ConversationEntity> conversations,  String failure)  watchFailure,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.conversations,_that.isRefreshing);case Empty():
return empty();case Failure():
return failure(_that.failure);case WatchFailure():
return watchFailure(_that.conversations,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ConversationEntity> conversations,  bool isRefreshing)?  loaded,TResult? Function()?  empty,TResult? Function( String failure)?  failure,TResult? Function( List<ConversationEntity> conversations,  String failure)?  watchFailure,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.conversations,_that.isRefreshing);case Empty() when empty != null:
return empty();case Failure() when failure != null:
return failure(_that.failure);case WatchFailure() when watchFailure != null:
return watchFailure(_that.conversations,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ConversationsState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsState.initial()';
}


}




/// @nodoc


class Loading implements ConversationsState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsState.loading()';
}


}




/// @nodoc


class Loaded implements ConversationsState {
  const Loaded({required final  List<ConversationEntity> conversations, this.isRefreshing = false}): _conversations = conversations;
  

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
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._conversations, _conversations)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations),isRefreshing);

@override
String toString() {
  return 'ConversationsState.loaded(conversations: $conversations, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $ConversationsStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<ConversationEntity> conversations, bool isRefreshing
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversations = null,Object? isRefreshing = null,}) {
  return _then(Loaded(
conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationEntity>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Empty implements ConversationsState {
  const Empty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Empty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsState.empty()';
}


}




/// @nodoc


class Failure implements ConversationsState {
  const Failure({required this.failure});
  

 final  String failure;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ConversationsState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $ConversationsStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String failure
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(Failure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as String,
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

 final  String failure;

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
 List<ConversationEntity> conversations, String failure
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
as String,
  ));
}


}

// dart format on
