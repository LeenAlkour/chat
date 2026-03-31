// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friendships_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendshipsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendshipsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FriendshipsEvent()';
}


}

/// @nodoc
class $FriendshipsEventCopyWith<$Res>  {
$FriendshipsEventCopyWith(FriendshipsEvent _, $Res Function(FriendshipsEvent) __);
}


/// Adds pattern-matching-related methods to [FriendshipsEvent].
extension FriendshipsEventPatterns on FriendshipsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchAll value)?  fetchAll,TResult Function( FriendUpdated value)?  friendUpdated,TResult Function( SendRequest value)?  sendRequest,TResult Function( AcceptRequest value)?  acceptRequest,TResult Function( RejectRequest value)?  rejectRequest,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchAll() when fetchAll != null:
return fetchAll(_that);case FriendUpdated() when friendUpdated != null:
return friendUpdated(_that);case SendRequest() when sendRequest != null:
return sendRequest(_that);case AcceptRequest() when acceptRequest != null:
return acceptRequest(_that);case RejectRequest() when rejectRequest != null:
return rejectRequest(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchAll value)  fetchAll,required TResult Function( FriendUpdated value)  friendUpdated,required TResult Function( SendRequest value)  sendRequest,required TResult Function( AcceptRequest value)  acceptRequest,required TResult Function( RejectRequest value)  rejectRequest,}){
final _that = this;
switch (_that) {
case FetchAll():
return fetchAll(_that);case FriendUpdated():
return friendUpdated(_that);case SendRequest():
return sendRequest(_that);case AcceptRequest():
return acceptRequest(_that);case RejectRequest():
return rejectRequest(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchAll value)?  fetchAll,TResult? Function( FriendUpdated value)?  friendUpdated,TResult? Function( SendRequest value)?  sendRequest,TResult? Function( AcceptRequest value)?  acceptRequest,TResult? Function( RejectRequest value)?  rejectRequest,}){
final _that = this;
switch (_that) {
case FetchAll() when fetchAll != null:
return fetchAll(_that);case FriendUpdated() when friendUpdated != null:
return friendUpdated(_that);case SendRequest() when sendRequest != null:
return sendRequest(_that);case AcceptRequest() when acceptRequest != null:
return acceptRequest(_that);case RejectRequest() when rejectRequest != null:
return rejectRequest(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchAll,TResult Function( UserFriend user)?  friendUpdated,TResult Function( String userId)?  sendRequest,TResult Function( String userId)?  acceptRequest,TResult Function( String userId)?  rejectRequest,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchAll() when fetchAll != null:
return fetchAll();case FriendUpdated() when friendUpdated != null:
return friendUpdated(_that.user);case SendRequest() when sendRequest != null:
return sendRequest(_that.userId);case AcceptRequest() when acceptRequest != null:
return acceptRequest(_that.userId);case RejectRequest() when rejectRequest != null:
return rejectRequest(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchAll,required TResult Function( UserFriend user)  friendUpdated,required TResult Function( String userId)  sendRequest,required TResult Function( String userId)  acceptRequest,required TResult Function( String userId)  rejectRequest,}) {final _that = this;
switch (_that) {
case FetchAll():
return fetchAll();case FriendUpdated():
return friendUpdated(_that.user);case SendRequest():
return sendRequest(_that.userId);case AcceptRequest():
return acceptRequest(_that.userId);case RejectRequest():
return rejectRequest(_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchAll,TResult? Function( UserFriend user)?  friendUpdated,TResult? Function( String userId)?  sendRequest,TResult? Function( String userId)?  acceptRequest,TResult? Function( String userId)?  rejectRequest,}) {final _that = this;
switch (_that) {
case FetchAll() when fetchAll != null:
return fetchAll();case FriendUpdated() when friendUpdated != null:
return friendUpdated(_that.user);case SendRequest() when sendRequest != null:
return sendRequest(_that.userId);case AcceptRequest() when acceptRequest != null:
return acceptRequest(_that.userId);case RejectRequest() when rejectRequest != null:
return rejectRequest(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class FetchAll implements FriendshipsEvent {
  const FetchAll();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchAll);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FriendshipsEvent.fetchAll()';
}


}




/// @nodoc


class FriendUpdated implements FriendshipsEvent {
  const FriendUpdated(this.user);
  

 final  UserFriend user;

/// Create a copy of FriendshipsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendUpdatedCopyWith<FriendUpdated> get copyWith => _$FriendUpdatedCopyWithImpl<FriendUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendUpdated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'FriendshipsEvent.friendUpdated(user: $user)';
}


}

/// @nodoc
abstract mixin class $FriendUpdatedCopyWith<$Res> implements $FriendshipsEventCopyWith<$Res> {
  factory $FriendUpdatedCopyWith(FriendUpdated value, $Res Function(FriendUpdated) _then) = _$FriendUpdatedCopyWithImpl;
@useResult
$Res call({
 UserFriend user
});


$UserFriendCopyWith<$Res> get user;

}
/// @nodoc
class _$FriendUpdatedCopyWithImpl<$Res>
    implements $FriendUpdatedCopyWith<$Res> {
  _$FriendUpdatedCopyWithImpl(this._self, this._then);

  final FriendUpdated _self;
  final $Res Function(FriendUpdated) _then;

/// Create a copy of FriendshipsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(FriendUpdated(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserFriend,
  ));
}

/// Create a copy of FriendshipsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserFriendCopyWith<$Res> get user {
  
  return $UserFriendCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class SendRequest implements FriendshipsEvent {
  const SendRequest(this.userId);
  

 final  String userId;

/// Create a copy of FriendshipsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendRequestCopyWith<SendRequest> get copyWith => _$SendRequestCopyWithImpl<SendRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendRequest&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'FriendshipsEvent.sendRequest(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $SendRequestCopyWith<$Res> implements $FriendshipsEventCopyWith<$Res> {
  factory $SendRequestCopyWith(SendRequest value, $Res Function(SendRequest) _then) = _$SendRequestCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$SendRequestCopyWithImpl<$Res>
    implements $SendRequestCopyWith<$Res> {
  _$SendRequestCopyWithImpl(this._self, this._then);

  final SendRequest _self;
  final $Res Function(SendRequest) _then;

/// Create a copy of FriendshipsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(SendRequest(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AcceptRequest implements FriendshipsEvent {
  const AcceptRequest(this.userId);
  

 final  String userId;

/// Create a copy of FriendshipsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcceptRequestCopyWith<AcceptRequest> get copyWith => _$AcceptRequestCopyWithImpl<AcceptRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcceptRequest&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'FriendshipsEvent.acceptRequest(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $AcceptRequestCopyWith<$Res> implements $FriendshipsEventCopyWith<$Res> {
  factory $AcceptRequestCopyWith(AcceptRequest value, $Res Function(AcceptRequest) _then) = _$AcceptRequestCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$AcceptRequestCopyWithImpl<$Res>
    implements $AcceptRequestCopyWith<$Res> {
  _$AcceptRequestCopyWithImpl(this._self, this._then);

  final AcceptRequest _self;
  final $Res Function(AcceptRequest) _then;

/// Create a copy of FriendshipsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(AcceptRequest(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RejectRequest implements FriendshipsEvent {
  const RejectRequest(this.userId);
  

 final  String userId;

/// Create a copy of FriendshipsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RejectRequestCopyWith<RejectRequest> get copyWith => _$RejectRequestCopyWithImpl<RejectRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RejectRequest&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'FriendshipsEvent.rejectRequest(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $RejectRequestCopyWith<$Res> implements $FriendshipsEventCopyWith<$Res> {
  factory $RejectRequestCopyWith(RejectRequest value, $Res Function(RejectRequest) _then) = _$RejectRequestCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$RejectRequestCopyWithImpl<$Res>
    implements $RejectRequestCopyWith<$Res> {
  _$RejectRequestCopyWithImpl(this._self, this._then);

  final RejectRequest _self;
  final $Res Function(RejectRequest) _then;

/// Create a copy of FriendshipsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(RejectRequest(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
