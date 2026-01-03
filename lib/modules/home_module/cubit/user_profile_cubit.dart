import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_app/core/models/user_profile_model.dart';
import 'package:throw_app/core/repository/user_repository.dart';
import 'package:throw_app/core/storage/auth_storage_functions.dart';

part 'user_profile_state.dart';
part 'user_profile_cubit.freezed.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(const UserProfileState.initial());

  Future<void> getUserProfile() async {
    emit(const UserProfileState.loading());
    try {
      final uid = await AuthStorageFunctions().getUid();
      if (uid == null) {
        emit(const UserProfileState.error('User not found'));
        return;
      }
      final user = await UserRepository().getUserByUid(uid);
      if (user == null) {
        emit(const UserProfileState.error('User not found'));
        return;
      }
      emit(UserProfileState.success(user));
    } catch (e) {
      emit(UserProfileState.error(e.toString()));
    }
  }
}
