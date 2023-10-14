import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  bool status = true;

  onThemeModeSwitched(bool val) {
    emit(ProfileInitial());
    status = val;
    emit(ProfileModeSwitchedSuccess());
  }
}
