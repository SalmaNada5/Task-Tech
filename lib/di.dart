import 'package:task_tech/utils/exports.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //? Cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit());
  sl.registerFactory<CreateProfileCubit>(() => CreateProfileCubit());

  sl.registerFactory<HomeCubit>(() => HomeCubit());
  sl.registerFactory<ProfileCubit>(() => ProfileCubit());
}
