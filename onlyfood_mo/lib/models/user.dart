// "Id": "4c66f0e4-4ca0-4b6a-803f-9efb2b9914a0",
//   "lastName": "Phat",
//   "userName": "fatnofat",
//   "email": "nguyenphat2711@gmail.com",
//   "role": "Admin",
//   "exp": 1699418913,
//   "iss": "https://localhost:44381/",
//   "aud": "https://localhost:44381/"

import 'dart:convert';

class User {
  late String id;
  late String lastName;
  late String userName;
  late String email;
  late String role;

  User({
    required this.id,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['Id'] as String? ?? '',
      lastName: json['LastName'] as String? ?? '',
      userName: json['UserName'] as String? ?? '',
      email: json['Email'] as String? ?? '',
      role: json['Role'] as String? ?? '',
    );
  }
}
