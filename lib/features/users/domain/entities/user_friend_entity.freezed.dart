// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_friend_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserFriend {

 String get id; String get username; String? get avatarUrl; String? get fullName; bool get isOnline; String? get friendshipId;// null إذا لم توجد علاقة بعد
 FriendStatus get status;
/// Create a copy of UserFriend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFriendCopyWith<UserFriend> get copyWith => _$UserFriendCopyWithImpl<UserFriend>(this as UserFriend, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFriend&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.friendshipId, friendshipId) || other.friendshipId == friendshipId)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,username,avatarUrl,fullName,isOnline,friendshipId,status);

@override
String toString() {
  return 'UserFriend(id: $id, username: $username, avatarUrl: $avatarUrl, fullName: $fullName, isOnline: $isOnline, friendshipId: $friendshipId, status: $status)';
}


}

/// @nodoc
abstract mixin class $UserFriendCopyWith<$Res>  {
  factory $UserFriendCopyWith(UserFriend value, $Res Function(UserFriend) _then) = _$UserFriendCopyWithImpl;
@useResult
$Res call({
 String id, String username, String? avatarUrl, String? fullName, bool isOnline, String? friendshipId, FriendStatus status
});




}
/// @nodoc
class _$UserFriendCopyWithImpl<$Res>
    implements $UserFriendCopyWith<$Res> {
  _$UserFriendCopyWithImpl(this._self, this._then);

  final UserFriend _self;
  final $Res Function(UserFriend) _then;

/// Create a copy of UserFriend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? avatarUrl = freezed,Object? fullName = freezed,Object? isOnline = null,Object? friendshipId = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,friendshipId: freezed == friendshipId ? _self.friendshipId : friendshipId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FriendStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [UserFriend].
extension UserFriendPatterns on UserFriend {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserFriend value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserFriend() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserFriend value)  $default,){
final _that = this;
switch (_that) {
case _UserFriend():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserFriend value)?  $default,){
final _that = this;
switch (_that) {
case _UserFriend() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String? avatarUrl,  String? fullName,  bool isOnline,  String? friendshipId,  FriendStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserFriend() when $default != null:
return $default(_that.id,_that.username,_that.avatarUrl,_that.fullName,_that.isOnline,_that.friendshipId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String? avatarUrl,  String? fullName,  bool isOnline,  String? friendshipId,  FriendStatus status)  $default,) {final _that = this;
switch (_that) {
case _UserFriend():
return $default(_that.id,_that.username,_that.avatarUrl,_that.fullName,_that.isOnline,_that.friendshipId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String? avatarUrl,  String? fullName,  bool isOnline,  String? friendshipId,  FriendStatus status)?  $default,) {final _that = this;
switch (_that) {
case _UserFriend() when $default != null:
return $default(_that.id,_that.username,_that.avatarUrl,_that.fullName,_that.isOnline,_that.friendshipId,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _UserFriend implements UserFriend {
  const _UserFriend({required this.id, required this.username, this.avatarUrl, this.fullName, required this.isOnline, this.friendshipId, required this.status});
  

@override final  String id;
@override final  String username;
@override final  String? avatarUrl;
@override final  String? fullName;
@override final  bool isOnline;
@override final  String? friendshipId;
// null إذا لم توجد علاقة بعد
@override final  FriendStatus status;

/// Create a copy of UserFriend
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserFriendCopyWith<_UserFriend> get copyWith => __$UserFriendCopyWithImpl<_UserFriend>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserFriend&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.friendshipId, friendshipId) || other.friendshipId == friendshipId)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,username,avatarUrl,fullName,isOnline,friendshipId,status);

@override
String toString() {
  return 'UserFriend(id: $id, username: $username, avatarUrl: $avatarUrl, fullName: $fullName, isOnline: $isOnline, friendshipId: $friendshipId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UserFriendCopyWith<$Res> implements $UserFriendCopyWith<$Res> {
  factory _$UserFriendCopyWith(_UserFriend value, $Res Function(_UserFriend) _then) = __$UserFriendCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String? avatarUrl, String? fullName, bool isOnline, String? friendshipId, FriendStatus status
});




}
/// @nodoc
class __$UserFriendCopyWithImpl<$Res>
    implements _$UserFriendCopyWith<$Res> {
  __$UserFriendCopyWithImpl(this._self, this._then);

  final _UserFriend _self;
  final $Res Function(_UserFriend) _then;

/// Create a copy of UserFriend
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? avatarUrl = freezed,Object? fullName = freezed,Object? isOnline = null,Object? friendshipId = freezed,Object? status = null,}) {
  return _then(_UserFriend(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,friendshipId: freezed == friendshipId ? _self.friendshipId : friendshipId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FriendStatus,
  ));
}


}

// dart format on
