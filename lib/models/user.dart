class User {
  final int? id;
  final String fullName;
  final String email;
  final String address;
  final String phoneNumber;
  final String username;
  final String password;

  User({
    this.id,
    required this.fullName,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
      'username': username,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      fullName: map['fullName'],
      email: map['email'],
      address: map['address'],
      phoneNumber: map['phoneNumber'],
      username: map['username'],
      password: map['password'],
    );
  }
}
