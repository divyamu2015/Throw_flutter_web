// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileState()';
}


}

/// @nodoc
class $UserProfileStateCopyWith<$Res>  {
$UserProfileStateCopyWith(UserProfileState _, $Res Function(UserProfileState) __);
}


/// Adds pattern-matching-related methods to [UserProfileState].
extension UserProfileStatePatterns on UserProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserProfileInitial value)?  initial,TResult Function( UserProfileLoading value)?  loading,TResult Function( UserProfileSuccess value)?  success,TResult Function( UserProfileError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserProfileInitial() when initial != null:
return initial(_that);case UserProfileLoading() when loading != null:
return loading(_that);case UserProfileSuccess() when success != null:
return success(_that);case UserProfileError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserProfileInitial value)  initial,required TResult Function( UserProfileLoading value)  loading,required TResult Function( UserProfileSuccess value)  success,required TResult Function( UserProfileError value)  error,}){
final _that = this;
switch (_that) {
case UserProfileInitial():
return initial(_that);case UserProfileLoading():
return loading(_that);case UserProfileSuccess():
return success(_that);case UserProfileError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserProfileInitial value)?  initial,TResult? Function( UserProfileLoading value)?  loading,TResult? Function( UserProfileSuccess value)?  success,TResult? Function( UserProfileError value)?  error,}){
final _that = this;
switch (_that) {
case UserProfileInitial() when initial != null:
return initial(_that);case UserProfileLoading() when loading != null:
return loading(_that);case UserProfileSuccess() when success != null:
return success(_that);case UserProfileError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserProfileModel userProfile)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserProfileInitial() when initial != null:
return initial();case UserProfileLoading() when loading != null:
return loading();case UserProfileSuccess() when success != null:
return success(_that.userProfile);case UserProfileError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserProfileModel userProfile)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case UserProfileInitial():
return initial();case UserProfileLoading():
return loading();case UserProfileSuccess():
return success(_that.userProfile);case UserProfileError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserProfileModel userProfile)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case UserProfileInitial() when initial != null:
return initial();case UserProfileLoading() when loading != null:
return loading();case UserProfileSuccess() when success != null:
return success(_that.userProfile);case UserProfileError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class UserProfileInitial implements UserProfileState {
  const UserProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileState.initial()';
}


}




/// @nodoc


class UserProfileLoading implements UserProfileState {
  const UserProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileState.loading()';
}


}




/// @nodoc


class UserProfileSuccess implements UserProfileState {
  const UserProfileSuccess(this.userProfile);
  

 final  UserProfileModel userProfile;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileSuccessCopyWith<UserProfileSuccess> get copyWith => _$UserProfileSuccessCopyWithImpl<UserProfileSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileSuccess&&(identical(other.userProfile, userProfile) || other.userProfile == userProfile));
}


@override
int get hashCode => Object.hash(runtimeType,userProfile);

@override
String toString() {
  return 'UserProfileState.success(userProfile: $userProfile)';
}


}

/// @nodoc
abstract mixin class $UserProfileSuccessCopyWith<$Res> implements $UserProfileStateCopyWith<$Res> {
  factory $UserProfileSuccessCopyWith(UserProfileSuccess value, $Res Function(UserProfileSuccess) _then) = _$UserProfileSuccessCopyWithImpl;
@useResult
$Res call({
 UserProfileModel userProfile
});




}
/// @nodoc
class _$UserProfileSuccessCopyWithImpl<$Res>
    implements $UserProfileSuccessCopyWith<$Res> {
  _$UserProfileSuccessCopyWithImpl(this._self, this._then);

  final UserProfileSuccess _self;
  final $Res Function(UserProfileSuccess) _then;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userProfile = null,}) {
  return _then(UserProfileSuccess(
null == userProfile ? _self.userProfile : userProfile // ignore: cast_nullable_to_non_nullable
as UserProfileModel,
  ));
}


}

/// @nodoc


class UserProfileError implements UserProfileState {
  const UserProfileError(this.message);
  

 final  String message;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileErrorCopyWith<UserProfileError> get copyWith => _$UserProfileErrorCopyWithImpl<UserProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserProfileState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $UserProfileErrorCopyWith<$Res> implements $UserProfileStateCopyWith<$Res> {
  factory $UserProfileErrorCopyWith(UserProfileError value, $Res Function(UserProfileError) _then) = _$UserProfileErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UserProfileErrorCopyWithImpl<$Res>
    implements $UserProfileErrorCopyWith<$Res> {
  _$UserProfileErrorCopyWithImpl(this._self, this._then);

  final UserProfileError _self;
  final $Res Function(UserProfileError) _then;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UserProfileError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
