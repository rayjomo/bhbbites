class BabyPrefrences {
  DateTime birthDate;
  String gender;
  String allergies;
  String foodPrefrences;


  BabyPrefrences (
      this.birthDate,
      this.gender,
      this.allergies,
      this.foodPrefrences);

  Map<String, dynamic> toJson() => {

      'birthDate': birthDate,
      'gender': gender,
      'allergies' : allergies,
      'foodprefrences' : foodPrefrences

  };
}