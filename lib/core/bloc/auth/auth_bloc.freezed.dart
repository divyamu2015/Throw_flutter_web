// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CheckAuthStatus value)?  checkAuthStatus,TResult Function( SignInWithGoogle value)?  signInWithGoogle,TResult Function( TrySilentSignIn value)?  trySilentSignIn,TResult Function( SignOut value)?  signOut,TResult Function( ResetError value)?  resetError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case SignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle(_that);case TrySilentSignIn() when trySilentSignIn != null:
return trySilentSignIn(_that);case SignOut() when signOut != null:
return signOut(_that);case ResetError() when resetError != null:
return resetError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CheckAuthStatus value)  checkAuthStatus,required TResult Function( SignInWithGoogle value)  signInWithGoogle,required TResult Function( TrySilentSignIn value)  trySilentSignIn,required TResult Function( SignOut value)  signOut,required TResult Function( ResetError value)  resetError,}){
final _that = this;
switch (_that) {
case CheckAuthStatus():
return checkAuthStatus(_that);case SignInWithGoogle():
return signInWithGoogle(_that);case TrySilentSignIn():
return trySilentSignIn(_that);case SignOut():
return signOut(_that);case ResetError():
return resetError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CheckAuthStatus value)?  checkAuthStatus,TResult? Function( SignInWithGoogle value)?  signInWithGoogle,TResult? Function( TrySilentSignIn value)?  trySilentSignIn,TResult? Function( SignOut value)?  signOut,TResult? Function( ResetError value)?  resetError,}){
final _that = this;
switch (_that) {
case CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case SignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle(_that);case TrySilentSignIn() when trySilentSignIn != null:
return trySilentSignIn(_that);case SignOut() when signOut != null:
return signOut(_that);case ResetError() when resetError != null:
return resetError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkAuthStatus,TResult Function()?  signInWithGoogle,TResult Function()?  trySilentSignIn,TResult Function()?  signOut,TResult Function()?  resetError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus();case SignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle();case TrySilentSignIn() when trySilentSignIn != null:
return trySilentSignIn();case SignOut() when signOut != null:
return signOut();case ResetError() when resetError != null:
return resetError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkAuthStatus,required TResult Function()  signInWithGoogle,required TResult Function()  trySilentSignIn,required TResult Function()  signOut,required TResult Function()  resetError,}) {final _that = this;
switch (_that) {
case CheckAuthStatus():
return checkAuthStatus();case SignInWithGoogle():
return signInWithGoogle();case TrySilentSignIn():
return trySilentSignIn();case SignOut():
return signOut();case ResetError():
return resetError();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkAuthStatus,TResult? Function()?  signInWithGoogle,TResult? Function()?  trySilentSignIn,TResult? Function()?  signOut,TResult? Function()?  resetError,}) {final _that = this;
switch (_that) {
case CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus();case SignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle();case TrySilentSignIn() when trySilentSignIn != null:
return trySilentSignIn();case SignOut() when signOut != null:
return signOut();case ResetError() when resetError != null:
return resetError();case _:
  return null;

}
}

}

/// @nodoc


class CheckAuthStatus with DiagnosticableTreeMixin implements AuthEvent {
  const CheckAuthStatus();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.checkAuthStatus'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAuthStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.checkAuthStatus()';
}


}




/// @nodoc


class SignInWithGoogle with DiagnosticableTreeMixin implements AuthEvent {
  const SignInWithGoogle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.signInWithGoogle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithGoogle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.signInWithGoogle()';
}


}




/// @nodoc


class TrySilentSignIn with DiagnosticableTreeMixin implements AuthEvent {
  const TrySilentSignIn();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.trySilentSignIn'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrySilentSignIn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.trySilentSignIn()';
}


}




/// @nodoc


class SignOut with DiagnosticableTreeMixin implements AuthEvent {
  const SignOut();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.signOut'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.signOut()';
}


}




/// @nodoc


class ResetError with DiagnosticableTreeMixin implements AuthEvent {
  const ResetError();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.resetError'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.resetError()';
}


}




/// @nodoc
mixin _$AuthState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Authenticated value)?  authenticated,TResult Function( Unauthenticated value)?  unauthenticated,TResult Function( AuthErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Authenticated value)  authenticated,required TResult Function( Unauthenticated value)  unauthenticated,required TResult Function( AuthErrorState value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Authenticated():
return authenticated(_that);case Unauthenticated():
return unauthenticated(_that);case AuthErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Authenticated value)?  authenticated,TResult? Function( Unauthenticated value)?  unauthenticated,TResult? Function( AuthErrorState value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserProfile user)?  authenticated,TResult Function()?  unauthenticated,TResult Function( String message,  String? details,  String? code)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Authenticated() when authenticated != null:
return authenticated(_that.user);case Unauthenticated() when unauthenticated != null:
return unauthenticated();case AuthErrorState() when error != null:
return error(_that.message,_that.details,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserProfile user)  authenticated,required TResult Function()  unauthenticated,required TResult Function( String message,  String? details,  String? code)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Authenticated():
return authenticated(_that.user);case Unauthenticated():
return unauthenticated();case AuthErrorState():
return error(_that.message,_that.details,_that.code);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserProfile user)?  authenticated,TResult? Function()?  unauthenticated,TResult? Function( String message,  String? details,  String? code)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Authenticated() when authenticated != null:
return authenticated(_that.user);case Unauthenticated() when unauthenticated != null:
return unauthenticated();case AuthErrorState() when error != null:
return error(_that.message,_that.details,_that.code);case _:
  return null;

}
}

}

/// @nodoc


class Initial with DiagnosticableTreeMixin implements AuthState {
  const Initial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.initial()';
}


}




/// @nodoc


class Loading with DiagnosticableTreeMixin implements AuthState {
  const Loading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.loading()';
}


}




/// @nodoc


class Authenticated with DiagnosticableTreeMixin implements AuthState {
  const Authenticated({required this.user});
  

 final  UserProfile user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedCopyWith<Authenticated> get copyWith => _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.authenticated'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.authenticated(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthenticatedCopyWith(Authenticated value, $Res Function(Authenticated) _then) = _$AuthenticatedCopyWithImpl;
@useResult
$Res call({
 UserProfile user
});


$UserProfileCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(this._self, this._then);

  final Authenticated _self;
  final $Res Function(Authenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(Authenticated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserProfile,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res> get user {
  
  return $UserProfileCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class Unauthenticated with DiagnosticableTreeMixin implements AuthState {
  const Unauthenticated();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.unauthenticated'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.unauthenticated()';
}


}




/// @nodoc


class AuthErrorState with DiagnosticableTreeMixin implements AuthState {
  const AuthErrorState({required this.message, this.details, this.code});
  

 final  String message;
 final  String? details;
 final  String? code;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthErrorStateCopyWith<AuthErrorState> get copyWith => _$AuthErrorStateCopyWithImpl<AuthErrorState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.error'))
    ..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('details', details))..add(DiagnosticsProperty('code', code));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthErrorState&&(identical(other.message, message) || other.message == message)&&(identical(other.details, details) || other.details == details)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,message,details,code);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.error(message: $message, details: $details, code: $code)';
}


}

/// @nodoc
abstract mixin class $AuthErrorStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthErrorStateCopyWith(AuthErrorState value, $Res Function(AuthErrorState) _then) = _$AuthErrorStateCopyWithImpl;
@useResult
$Res call({
 String message, String? details, String? code
});




}
/// @nodoc
class _$AuthErrorStateCopyWithImpl<$Res>
    implements $AuthErrorStateCopyWith<$Res> {
  _$AuthErrorStateCopyWithImpl(this._self, this._then);

  final AuthErrorState _self;
  final $Res Function(AuthErrorState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? details = freezed,Object? code = freezed,}) {
  return _then(AuthErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
