class UserModel {
  final String id;
  final String email;

  UserModel({required this.id, required this.email});

  // #Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }

// #Convert JSON to User object
  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'];
}
