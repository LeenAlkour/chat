// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthStatusChecked value)?  authStatusChecked,TResult Function( LoginRequested value)?  loginRequested,TResult Function( RegisterRequested value)?  registerRequested,TResult Function( LogoutRequested value)?  logoutRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthStatusChecked() when authStatusChecked != null:
return authStatusChecked(_that);case LoginRequested() when loginRequested != null:
return loginRequested(_that);case RegisterRequested() when registerRequested != null:
return registerRequested(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthStatusChecked value)  authStatusChecked,required TResult Function( LoginRequested value)  loginRequested,required TResult Function( RegisterRequested value)  registerRequested,required TResult Function( LogoutRequested value)  logoutRequested,}){
final _that = this;
switch (_that) {
case AuthStatusChecked():
return authStatusChecked(_that);case LoginRequested():
return loginRequested(_that);case RegisterRequested():
return registerRequested(_that);case LogoutRequested():
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthStatusChecked value)?  authStatusChecked,TResult? Function( LoginRequested value)?  loginRequested,TResult? Function( RegisterRequested value)?  registerRequested,TResult? Function( LogoutRequested value)?  logoutRequested,}){
final _that = this;
switch (_that) {
case AuthStatusChecked() when authStatusChecked != null:
return authStatusChecked(_that);case LoginRequested() when loginRequested != null:
return loginRequested(_that);case RegisterRequested() when registerRequested != null:
return registerRequested(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  authStatusChecked,TResult Function( UserEntity user)?  loginRequested,TResult Function( UserEntity user)?  registerRequested,TResult Function()?  logoutRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthStatusChecked() when authStatusChecked != null:
return authStatusChecked();case LoginRequested() when loginRequested != null:
return loginRequested(_that.user);case RegisterRequested() when registerRequested != null:
return registerRequested(_that.user);case LogoutRequested() when logoutRequested != null:
return logoutRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  authStatusChecked,required TResult Function( UserEntity user)  loginRequested,required TResult Function( UserEntity user)  registerRequested,required TResult Function()  logoutRequested,}) {final _that = this;
switch (_that) {
case AuthStatusChecked():
return authStatusChecked();case LoginRequested():
return loginRequested(_that.user);case RegisterRequested():
return registerRequested(_that.user);case LogoutRequested():
return logoutRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  authStatusChecked,TResult? Function( UserEntity user)?  loginRequested,TResult? Function( UserEntity user)?  registerRequested,TResult? Function()?  logoutRequested,}) {final _that = this;
switch (_that) {
case AuthStatusChecked() when authStatusChecked != null:
return authStatusChecked();case LoginRequested() when loginRequested != null:
return loginRequested(_that.user);case RegisterRequested() when registerRequested != null:
return registerRequested(_that.user);case LogoutRequested() when logoutRequested != null:
return logoutRequested();case _:
  return null;

}
}

}

/// @nodoc


class AuthStatusChecked implements AuthEvent {
  const AuthStatusChecked();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStatusChecked);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.authStatusChecked()';
}


}




/// @nodoc


class LoginRequested implements AuthEvent {
  const LoginRequested({required this.user});
  

 final  UserEntity user;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestedCopyWith<LoginRequested> get copyWith => _$LoginRequestedCopyWithImpl<LoginRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequested&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthEvent.loginRequested(user: $user)';
}


}

/// @nodoc
abstract mixin class $LoginRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $LoginRequestedCopyWith(LoginRequested value, $Res Function(LoginRequested) _then) = _$LoginRequestedCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});


$UserEntityCopyWith<$Res> get user;

}
/// @nodoc
class _$LoginRequestedCopyWithImpl<$Res>
    implements $LoginRequestedCopyWith<$Res> {
  _$LoginRequestedCopyWithImpl(this._self, this._then);

  final LoginRequested _self;
  final $Res Function(LoginRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(LoginRequested(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get user {
  
  return $UserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class RegisterRequested implements AuthEvent {
  const RegisterRequested({required this.user});
  

 final  UserEntity user;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterRequestedCopyWith<RegisterRequested> get copyWith => _$RegisterRequestedCopyWithImpl<RegisterRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterRequested&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthEvent.registerRequested(user: $user)';
}


}

/// @nodoc
abstract mixin class $RegisterRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $RegisterRequestedCopyWith(RegisterRequested value, $Res Function(RegisterRequested) _then) = _$RegisterRequestedCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});


$UserEntityCopyWith<$Res> get user;

}
/// @nodoc
class _$RegisterRequestedCopyWithImpl<$Res>
    implements $RegisterRequestedCopyWith<$Res> {
  _$RegisterRequestedCopyWithImpl(this._self, this._then);

  final RegisterRequested _self;
  final $Res Function(RegisterRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(RegisterRequested(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get user {
  
  return $UserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class LogoutRequested implements AuthEvent {
  const LogoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logoutRequested()';
}


}




// dart format on
