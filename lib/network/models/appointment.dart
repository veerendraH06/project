class Patient {
  int id;
  String name;
  String email;

  Patient({this.id, this.name, this.email});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json["id"] as int,
      name: json["name"] as String,
      email: json["email"] as String,
    );
  }
}
