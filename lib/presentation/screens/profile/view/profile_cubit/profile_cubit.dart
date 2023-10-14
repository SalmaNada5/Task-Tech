import 'package:equatable/equatable.dart';
import 'package:task_tech/utils/exports.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  bool status = true;

  onThemeModeSwitched(bool val) {
    emit(ProfileInitial());
    status = val;
    emit(ProfileModeSwitchedSuccess());
  }
  
  bool isFollowed = false;

  void getProfileDataFunction() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        Constants.showLoading();
        await CurrentUserInfoController.getUserInfoFunc();
        try {
          String? id = CurrentUserInfoController
              .userInfoModel.data?.user.followings!
              .firstWhere((element) =>
                  element.toString() == UserController.userModel.data?.user.id);
          if (id != null) {
            isFollowed = true;
          }
        } catch (e) {
          isFollowed = false;
          logError('$e');
        }
        Constants.hideLoadingOrNavBack();
      } catch (e) {
        logError('$e in getProfileDataFunction');
      }
    });
  }

  void followOrUnfollowFunction() {
    emit(ProfileInitial());
    isFollowed = !isFollowed;
    emit(FollowOrUnFollowButtonPressed());
  }
}
