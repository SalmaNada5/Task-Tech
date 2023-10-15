import 'package:task_tech/utils/exports.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //? Cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit());
  sl.registerFactory<CreateProfileCubit>(() => CreateProfileCubit());
  sl.registerFactory<HomeCubit>(() => HomeCubit());
  sl.registerFactory<ProfileCubit>(() => ProfileCubit());
  sl.registerFactory<AddPostCubit>(() => AddPostCubit());
  sl.registerFactory<PostsCubit>(() => PostsCubit());
  sl.registerFactory<PostDetailsCubit>(() => PostDetailsCubit());
  sl.registerFactory<PaymentCubit>(() => PaymentCubit());
}
