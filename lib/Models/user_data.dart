class UserModel {
  final String email;
  final String? name;
  final String? image;
  final bool? mentor;

  UserModel({
    required this.email,
    this.name,
    this.image,
    this.mentor,
  });

  /// The method converts the object returned from a firebase snapshot into json data
  UserModel.fromJson(Map<String, Object?> json)
      : this(
          email: json['email']! as String ,
          name: json.putIfAbsent('name', () => "Enter name") as String,
          image: json.putIfAbsent('image', () => "assets/profiles/3.png") as String,
          mentor: json.putIfAbsent('mentor', () => false) as bool,
        );

  ///The method converts data to json format to send to firebase
  Map<String, Object?> toJson() {
    return {
      "email": email,
      "name": name,
      "image": image,
      "mentor":mentor
    };
  }
}
