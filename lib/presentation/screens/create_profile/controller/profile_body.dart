mixin ProfileBody {
  static Map<String, dynamic> profileMap(
          {required String about,
          required int minimum,
          required int maximum,
          required String currency,
          required String ferquency,
          required String catogery,
          required String job,
          required String phoneNumber,
          required String gender,
          required String age,
          required String birthDate,
          required String location,
          required List<String> skills,
          required String education}) =>
      {
        "minimum": minimum,
        "maximum": maximum,
        "currency": currency,
        "ferquency": ferquency,
        "catogery": catogery,
        "jop": job,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "age": age,
        "birthDate": birthDate,
        "location": location,
        "skills": skills,
        "education": education
      };
}
