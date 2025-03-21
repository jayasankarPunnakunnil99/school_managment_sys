class Student {
  final String id;
  final String name;
  final String rollNumber;
  final String grade;
  final String section;
  final String parentName;
  final String parentPhone;
  final String address;
  final DateTime dateOfBirth;
  final DateTime admissionDate;
  final Map<String, dynamic> feeStructure;

  Student({
    required this.id,
    required this.name,
    required this.rollNumber,
    required this.grade,
    required this.section,
    required this.parentName,
    required this.parentPhone,
    required this.address,
    required this.dateOfBirth,
    required this.admissionDate,
    required this.feeStructure,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      rollNumber: json['rollNumber'],
      grade: json['grade'],
      section: json['section'],
      parentName: json['parentName'],
      parentPhone: json['parentPhone'],
      address: json['address'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      admissionDate: DateTime.parse(json['admissionDate']),
      feeStructure: Map<String, dynamic>.from(json['feeStructure']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rollNumber': rollNumber,
      'grade': grade,
      'section': section,
      'parentName': parentName,
      'parentPhone': parentPhone,
      'address': address,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'admissionDate': admissionDate.toIso8601String(),
      'feeStructure': feeStructure,
    };
  }
} 