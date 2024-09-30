class UserApiUserModel {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String username;
  final String phone;

  UserApiUserModel(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.username,
      required this.phone,
      required this.id});

  factory UserApiUserModel.fromJson(Map<String, dynamic> json) {
    return UserApiUserModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      id: json['id'],
      username: json['username'],
      phone: json['phone'],
    );
  }
}
