mixin AuthBody {
  static Map<String, dynamic> loginMap(String email, String password) =>
      {"email": email, "password": password};

  static Map<String, dynamic> signUpMap(
          {required String email,
          required String password,
          required String name,
          required String confirmPassword}) =>
      {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword
      };
}
