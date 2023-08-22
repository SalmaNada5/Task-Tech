mixin ProfileBody {
  static Map<String, dynamic> profileMap(
          {String? about,
          required int minimum,
          required int maximum,
          required String currency,
          required String ferquency,
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
        "job": job,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "age": age,
        "birthDate": birthDate,
        "location": location,
        "skills": skills,
        "education": education,
        "about": about,
      };
}
