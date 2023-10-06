import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/create_profile/controller/create_profile_controller.dart';
import 'package:task_tech/presentation/screens/create_profile/view/screens/create_profile.dart';

part 'create_profile_state.dart';

class CreateProfileCubit extends Cubit<CreateProfileState> {
  CreateProfileCubit() : super(CreateProfileInitial());

  Future<void> createProfileCubit(
      {String? about,
      required int minimum,
      required int maximum,
      required String currency,
      required String frequency,
      required String job,
      required String phoneNumber,
      required String gender,
      required String age,
      required String birthDate,
      required String location,
      required List<String> skills,
      required String education}) async{
    bool? result = await CreateProfileController.createProfileFunc(
        minimum: minimum,
        maximum: maximum,
        currency: currency,
        frequency: frequency,
        job: job,
        phoneNumber: phoneNumber,
        gender: gender,
        age: age,
        birthDate: birthDate,
        location: location,
        skills: skills,
        education: education);
        if (result!) {
       Constants.navigateTo(const CreateProfile(), pushAndRemoveUntil: true);
    } else {
      Constants.errorMessage(description: 'Invalid code');
    }
  }
}
