class anonymous {
  final String? uid;
  final String email;
  final String name;
  final String dob;
  final String gender;

  anonymous({
    this.uid,
    required this.email,
    required this.name,
    required this.dob,
    required this.gender,
  });
  Map<String, dynamic> toJason() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "dob": dob,
      "gender": gender,
      "createdAt": DateTime.now().toIso8601String()
    };
  }

  factory anonymous.fromJason(Map<String, dynamic> Jason) {
    return anonymous(
        email: Jason['email'],
        name: Jason['name'],
        dob: Jason['dob'],
        gender: Jason['gender']);
  }
}
