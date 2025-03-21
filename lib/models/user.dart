class User {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String role; // 'super_admin', 'sub_admin', 'teacher', 'staff'
  final Map<String, bool> permissions;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.permissions,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
      permissions: Map<String, bool>.from(json['permissions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role,
      'permissions': permissions,
    };
  }
} 