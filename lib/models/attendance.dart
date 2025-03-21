class Attendance {
  final String id;
  final String userId;
  final String userType; // 'student', 'teacher', 'staff'
  final DateTime date;
  final bool isPresent;
  final String? leaveReason;
  final bool isApproved;

  Attendance({
    required this.id,
    required this.userId,
    required this.userType,
    required this.date,
    required this.isPresent,
    this.leaveReason,
    required this.isApproved,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      id: json['id'],
      userId: json['userId'],
      userType: json['userType'],
      date: DateTime.parse(json['date']),
      isPresent: json['isPresent'],
      leaveReason: json['leaveReason'],
      isApproved: json['isApproved'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userType': userType,
      'date': date.toIso8601String(),
      'isPresent': isPresent,
      'leaveReason': leaveReason,
      'isApproved': isApproved,
    };
  }
} 