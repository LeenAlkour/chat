// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadUser value)?  loadUser,TResult Function( UpdateProfilePictureEvent value)?  updateProfilePicture,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadUser() when loadUser != null:
return loadUser(_that);case UpdateProfilePictureEvent() when updateProfilePicture != null:
return updateProfilePicture(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadUser value)  loadUser,required TResult Function( UpdateProfilePictureEvent value)  updateProfilePicture,}){
final _that = this;
switch (_that) {
case LoadUser():
return loadUser(_that);case UpdateProfilePictureEvent():
return updateProfilePicture(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadUser value)?  loadUser,TResult? Function( UpdateProfilePictureEvent value)?  updateProfilePicture,}){
final _that = this;
switch (_that) {
case LoadUser() when loadUser != null:
return loadUser(_that);case UpdateProfilePictureEvent() when updateProfilePicture != null:
return updateProfilePicture(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadUser,TResult Function( String filePath)?  updateProfilePicture,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadUser() when loadUser != null:
return loadUser();case UpdateProfilePictureEvent() when updateProfilePicture != null:
return updateProfilePicture(_that.filePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadUser,required TResult Function( String filePath)  updateProfilePicture,}) {final _that = this;
switch (_that) {
case LoadUser():
return loadUser();case UpdateProfilePictureEvent():
return updateProfilePicture(_that.filePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadUser,TResult? Function( String filePath)?  updateProfilePicture,}) {final _that = this;
switch (_that) {
case LoadUser() when loadUser != null:
return loadUser();case UpdateProfilePictureEvent() when updateProfilePicture != null:
return updateProfilePicture(_that.filePath);case _:
  return null;

}
}

}

/// @nodoc


class LoadUser implements ProfileEvent {
  const LoadUser();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadUser);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.loadUser()';
}


}




/// @nodoc


class UpdateProfilePictureEvent implements ProfileEvent {
  const UpdateProfilePictureEvent(this.filePath);
  

 final  String filePath;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfilePictureEventCopyWith<UpdateProfilePictureEvent> get copyWith => _$UpdateProfilePictureEventCopyWithImpl<UpdateProfilePictureEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfilePictureEvent&&(identical(other.filePath, filePath) || other.filePath == filePath));
}


@override
int get hashCode => Object.hash(runtimeType,filePath);

@override
String toString() {
  return 'ProfileEvent.updateProfilePicture(filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class $UpdateProfilePictureEventCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $UpdateProfilePictureEventCopyWith(UpdateProfilePictureEvent value, $Res Function(UpdateProfilePictureEvent) _then) = _$UpdateProfilePictureEventCopyWithImpl;
@useResult
$Res call({
 String filePath
});




}
/// @nodoc
class _$UpdateProfilePictureEventCopyWithImpl<$Res>
    implements $UpdateProfilePictureEventCopyWith<$Res> {
  _$UpdateProfilePictureEventCopyWithImpl(this._self, this._then);

  final UpdateProfilePictureEvent _self;
  final $Res Function(UpdateProfilePictureEvent) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filePath = null,}) {
  return _then(UpdateProfilePictureEvent(
null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
