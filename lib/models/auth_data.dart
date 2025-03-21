class AuthData {
  final String token;
  final String userId;
  final String role;
  final String email;
  final DateTime expiryDate;

  AuthData({
    required this.token,
    required this.userId,
    required this.role,
    required this.email,
    required this.expiryDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'userId': userId,
      'role': role,
      'email': email,
      'expiryDate': expiryDate.toIso8601String(),
    };
  }

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      token: json['token'],
      userId: json['userId'],
      role: json['role'],
      email: json['email'],
      expiryDate: DateTime.parse(json['expiryDate']),
    );
  }
} 