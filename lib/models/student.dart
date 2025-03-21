class Student {
  final String id;
  final String name;
  final String className;
  final List<String> subjects;

  Student({
    required this.id,
    required this.name,
    required this.className,
    required this.subjects,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      className: json['className'],
      subjects: List<String>.from(json['subjects']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'className': className,
      'subjects': subjects,
    };
  }
} 