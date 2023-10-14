part of 'create_profile_cubit.dart';

sealed class CreateProfileState {}

final class CreateProfileInitial extends CreateProfileState {}

final class UploadProfilePhotoPressedState extends CreateProfileState {}

final class OnGenderSelectedState extends CreateProfileState {}

final class OnEducationSelectedState extends CreateProfileState {}

final class OnDateSelectedState extends CreateProfileState {}

final class OnCurrencySelectedState extends CreateProfileState {}

final class OnFrequencySelectedState extends CreateProfileState {}

final class AddNewSkillChipState extends CreateProfileState {}

final class OnSkillChipSelectedState extends CreateProfileState {}
