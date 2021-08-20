class Actor {
  Actor({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  bool adult;
  List<dynamic> alsoKnownAs = ["none"];
  String biography = "";
   String birthday="";

  int gender=0;
  String homepage="";
  int id=0;
  String knownForDepartment="";
  String name="";
  String placeOfBirth="";
  double popularity=0;
  String profilePath="";

  factory Actor.fromJson(final c) {
    return Actor(
      adult: c["adult"],
      alsoKnownAs: c["also_known_as"],
      biography: c["biography"],
      birthday: c["birthday"],
      gender: c["gender"],
      homepage: c["homepage"],
      id: c["id"],
      knownForDepartment: c["known_for_department"],
      name: c["name"],
      placeOfBirth: c["place_of_birth"],
      popularity: c["popularity"],
      profilePath: c["profile_path"],
    );
  }
}
