import 'dart:io';
import 'package:intl/intl.dart';
import 'package:task_tech/presentation/screens/create_profile/controller/create_profile_controller.dart';
import 'package:task_tech/presentation/screens/create_profile/model/filter_chip_skill_model.dart';
import 'package:task_tech/utils/exports.dart';
part 'create_profile_state.dart';

class CreateProfileCubit extends Cubit<CreateProfileState> {
  CreateProfileCubit() : super(CreateProfileInitial());

  Future<void> addProfileTextData(
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
      required String education}) async {
    bool? result = await CreateProfileController.createProfileFunc(
        about: about,
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
      Constants.navigateTo(
          const ProfileScreen(
            isMe: true,
          ),
          pushAndRemoveUntil: true);
    } else {
      Constants.errorMessage(description: 'Invalid code');
    }
  }

  Future<void> uploadCvCubit() async {
    bool result = await UploadCVController.uploadCVFunc();
    if (result) {
      logSuccess('CV uploaded successfully');
    } else {
      logError('CV not uploaded');
    }
  }

  Future<void> uploadProfilePhotoCubit() async {
    bool result = await UploadProfilePhotoController.uploadProfilePhotoFunc();
    if (result) {
      logSuccess('Profile photo uploaded successfully,');
    } else {
      logError(
          'Profile photo doest upload successfully, in uploadProfilePhotoCubit');
    }
  }

  Future<void> addAllProfileData() async {
    await addProfileTextData(
      minimum: int.parse(minSalaryController.text),
      maximum: int.parse(maxSalaryController.text),
      currency: currencyValue,
      frequency: frequencyValue,
      job: jobController.text,
      phoneNumber: phoneController.text,
      gender: gender,
      age: ageController.text,
      birthDate: dateController.text,
      location: locationController.text,
      skills: skills,
      education: education,
      about: descriptionController.text,
    );
    await uploadProfilePhotoCubit();
    await uploadCvCubit();
  }

//? Lists
  final List<String> educationList = [
    'Ain Shams University',
    'Al Alamein International University',
    'Al-Azhar University',
    'Alexandria University',
    'Arish University',
    'Assiut University',
    'Aswan University',
    'Badr University in Cairo',
    'Benha University',
    'Beni-Suef University',
    'Cairo University',
    'Damanhour University',
    'Damietta University',
    'Delta University for Science and Technology',
    'Egyptian Chinese University',
    'Egypt-Japan University of Science and Technology',
    'Fayoum University',
    'Future University in Egypt',
    'Galala University',
    'Helwan University',
    'Kafrelsheikh University',
    'Luxor University',
    'Mansoura University',
    'Matrouh University',
    'Menoufia University',
    'Minia University',
    'Misr International University',
    'New Valley University',
    'Pharos University in Alexandria',
    'Port Said University',
    'Sinai University',
    'Sohag university',
    'South Valley University',
    'Suez Canal University',
    'Suez University',
    'Tanta University',
    'The American University in Cairo',
    'The Arab Academy for Management',
    'Banking and Financial Sciences',
    'The British University in Egypt',
    'The German University in Cairo',
    "Université Française d'Égypte",
    'University of Sadat City',
    'University of Science and Technology at Zewail City',
    'Zagazig University',
    'Massachusetts Institute of Technology (MIT)',
    'Harvard University',
    'University of Oxford',
    'University of Cambridge',
    'ETH Zurich (Swiss Federal Institute of Technology)',
    'University of Tokyo',
    'Universite PSL',
  ];

  static List<String> categories = [
    'Web Design',
    'Marketing',
    'Business',
    'Software Engineering',
    'Web Developer',
    'App Developer',
    'Product Manager',
    'Accountant',
    'Ui/Ux Design',
    'Graphics Designer'
  ];

  final List<String> currencyList = <String>[
    'EUR',
    'USD',
    'SAR',
    'CHF',
    'EGP',
    'GBP',
  ];

  final List<String> frequencyList = <String>[
    'per hour',
    'per day',
    'per week',
    'per month'
  ];
  List<FilterChipSkillModel> skillsList = [
    FilterChipSkillModel(
      chipName: 'UI/UX',
    ),
    FilterChipSkillModel(
      chipName: 'Technology',
    ),
    FilterChipSkillModel(
      chipName: 'Interfaces',
    ),
    FilterChipSkillModel(
      chipName: 'Programming',
    ),
    FilterChipSkillModel(
      chipName: 'Writing',
    ),
    FilterChipSkillModel(
      chipName: 'Web design',
    ),
    FilterChipSkillModel(
      chipName: 'Art & illustration',
    ),
  ];

//* create profile screen logic
  TextEditingController descriptionController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? imagefile;
  void onUploadProfilePhotoPressed() async {
    emit(CreateProfileInitial());
    final result = await UploadProfilePhotoController.attachPhoto();
    if (result != null) {
      imagefile = File(result.files.single.path!);
    }
    emit(UploadProfilePhotoPressedState());
  }

  List<String> gendersList = <String>['male', 'female'];
  String gender = 'male';

  void onGenderSelected(String value) {
    emit(CreateProfileInitial());
    gender = value;
    emit(OnGenderSelectedState());
  }

  void onDateSelected(DateTime? time) {
    emit(CreateProfileInitial());
    dateController.text = DateFormat.yMMMd().format(time!);
    emit(OnDateSelectedState());
  }

  //* education screen logic
  String? dropdownValue;
  String education = '';
  void onEducationSelected(String? val) {
    emit(CreateProfileInitial());
    education = val!;
    dropdownValue = val;
    emit(OnEducationSelectedState());
  }

  //* salary screen logic

  TextEditingController minSalaryController = TextEditingController();
  TextEditingController maxSalaryController = TextEditingController();

  String currencyValue = 'EUR';
  void onCurrencySelected(String? value) {
    emit(CreateProfileInitial());
    currencyValue = value!;
    emit(OnCurrencySelectedState());
  }

  String frequencyValue = 'per hour';
  void onFrequencySelected(String? val) {
    emit(CreateProfileInitial());
    frequencyValue = val!;
    emit(OnFrequencySelectedState());
  }

  //* skills screen logic
  TextEditingController skillController = TextEditingController();

  void addNewSkillChip(String? val) {
    emit(CreateProfileInitial());
    if (val != '') {
      if (!skills.contains(val)) {
        skills.add(val!);
      }
      skillsList.add(FilterChipSkillModel(
        chipName: val!,
        isSelected: true,
      ));
      skillController.clear();
    }
    emit(AddNewSkillChipState());
  }

  void onSkillChipSelected(bool selected, int index) {
    emit(CreateProfileInitial());
    skillsList[index].isSelected = selected;
    if (skillsList[index].isSelected) {
      skills.add(skillsList[index].chipName);
    } else {
      if (skills.contains(skillsList[index].chipName)) {
        skills.remove(skillsList[index].chipName);
      }
    }
    emit(AddNewSkillChipState());
  }

  List<String> skills = [];
}
