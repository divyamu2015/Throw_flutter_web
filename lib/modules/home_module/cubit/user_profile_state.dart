part of 'user_profile_cubit.dart';

@freezed
sealed class UserProfileState with _$UserProfileState {
  const factory UserProfileState.initial() = UserProfileInitial;
  const factory UserProfileState.loading() = UserProfileLoading;
  const factory UserProfileState.success(UserProfileModel userProfile) =
      UserProfileSuccess;
  const factory UserProfileState.error(String message) = UserProfileError;
}
