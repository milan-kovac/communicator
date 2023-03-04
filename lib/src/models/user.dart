class UserModel {
  final String id;
  final String email;
  bool adminControl;

  UserModel({required this.id, required this.email, required this.adminControl});

  // #Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'adminControl': adminControl};
  }

// #Convert JSON to User object
  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        adminControl = json['adminControl'];
}
