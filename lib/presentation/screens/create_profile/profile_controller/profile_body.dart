mixin CreateProfileBody{
  static Map<String,dynamic> createProfileMap(
    final List<String> skills,
    String jop,
    final String about,
    final int age,
    final DateTime birthDate,
    final String catogery,
    final String currency,
    final String education,
    final String ferquency,
    final String gender,
    final String location,
    final int maximum,
    final int minimum,
     final String phoneNumber,
  )=>{
    "about":about,
     "minimum":minimum,
     "maximum":maximum,
     "currency":currency,
     "ferquency":ferquency,
     "catogery":catogery,
     "jop":jop,
     "phoneNumber":phoneNumber,
     "gender":gender,
     "age":age,
     "birthDate":birthDate,
     "location":location,
     "skills":skills,
     "education":education
  };

static Map<String,dynamic> uploadProfilePhotoMap(
  String photo
)=>{
  "photo": photo
};
}