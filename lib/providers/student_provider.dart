import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentProvider extends ChangeNotifier {
  List<Student> _students = [];
  String _selectedClass = 'All';
  String _selectedSubject = 'All';

  List<Student> get students => _students;
  String get selectedClass => _selectedClass;
  String get selectedSubject => _selectedSubject;

  // Example list of classes and subjects
  final List<String> classes = ['All', 'Class A', 'Class B', 'Class C'];
  final List<String> subjects = ['All', 'Mathematics', 'Science', 'English'];

  void setSelectedClass(String className) {
    _selectedClass = className;
    notifyListeners();
  }

  void setSelectedSubject(String subject) {
    _selectedSubject = subject;
    notifyListeners();
  }

  List<Student> getFilteredStudents() {
    return _students.where((student) {
      bool matchesClass = _selectedClass == 'All' || student.className == _selectedClass;
      bool matchesSubject = _selectedSubject == 'All' || student.subjects.contains(_selectedSubject);
      return matchesClass && matchesSubject;
    }).toList();
  }

  // Mock data loading - Replace with actual API call
  Future<void> loadStudents() async {
    // Simulating API call
    _students = [
      Student(
        id: '1',
        name: 'John Doe',
        className: 'Class A',
        subjects: ['Mathematics', 'Science'],
      ),
      Student(
        id: '2',
        name: 'Jane Smith',
        className: 'Class B',
        subjects: ['English', 'Science'],
      ),
      Student(
        id: '3',
        name: 'Alice Johnson',
        className: 'Class A',
        subjects: ['Mathematics', 'English', 'Science'],
      ),
      Student(
        id: '4',
        name: 'Bob Wilson',
        className: 'Class C',
        subjects: ['Science'],
      ),
      Student(
        id: '5',
        name: 'Carol Brown',
        className: 'Class B',
        subjects: ['Mathematics', 'English'],
      ),
      Student(
        id: '6',
        name: 'David Lee',
        className: 'Class A',
        subjects: ['English'],
      ),
      Student(
        id: '7',
        name: 'Emma Davis',
        className: 'Class C',
        subjects: ['Mathematics', 'Science'],
      ),
      Student(
        id: '8',
        name: 'Frank Miller',
        className: 'Class B',
        subjects: ['Science', 'English'],
      ),
      Student(
        id: '9',
        name: 'Grace Taylor',
        className: 'Class A',
        subjects: ['Mathematics'],
      ),
      Student(
        id: '10',
        name: 'Henry Anderson',
        className: 'Class C',
        subjects: ['English', 'Science'],
      ),
      Student(
        id: '11',
        name: 'Isabel White',
        className: 'Class B',
        subjects: ['Mathematics', 'Science', 'English'],
      ),
      Student(
        id: '12',
        name: 'Jack Thompson',
        className: 'Class A',
        subjects: ['Science'],
      ),
      Student(
        id: '13',
        name: 'Kelly Martinez',
        className: 'Class C',
        subjects: ['Mathematics', 'English'],
      ),
      Student(
        id: '14',
        name: 'Liam Garcia',
        className: 'Class B',
        subjects: ['English'],
      ),
      Student(
        id: '15',
        name: 'Mia Rodriguez',
        className: 'Class A',
        subjects: ['Mathematics', 'Science'],
      ),
      Student(
        id: '16',
        name: 'Noah Lewis',
        className: 'Class C',
        subjects: ['Science', 'English'],
      ),
      Student(
        id: '17',
        name: 'Olivia Clark',
        className: 'Class B',
        subjects: ['Mathematics'],
      ),
      Student(
        id: '18',
        name: 'Peter Wright',
        className: 'Class A',
        subjects: ['English', 'Science'],
      ),
      Student(
        id: '19',
        name: 'Quinn Young',
        className: 'Class C',
        subjects: ['Mathematics', 'Science', 'English'],
      ),
      Student(
        id: '20',
        name: 'Rachel King',
        className: 'Class B',
        subjects: ['Science'],
      ),
      Student(
        id: '21',
        name: 'Samuel Scott',
        className: 'Class A',
        subjects: ['Mathematics', 'English'],
      ),
      Student(
        id: '22',
        name: 'Tara Green',
        className: 'Class C',
        subjects: ['English'],
      ),
      Student(
        id: '23',
        name: 'Uma Patel',
        className: 'Class B',
        subjects: ['Mathematics', 'Science'],
      ),
      Student(
        id: '24',
        name: 'Victor Adams',
        className: 'Class A',
        subjects: ['Science', 'English'],
      ),
      Student(
        id: '25',
        name: 'Wendy Baker',
        className: 'Class C',
        subjects: ['Mathematics'],
      ),
      Student(
        id: '26',
        name: 'Xavier Cooper',
        className: 'Class B',
        subjects: ['English', 'Science'],
      ),
      Student(
        id: '27',
        name: 'Yara Hall',
        className: 'Class A',
        subjects: ['Mathematics', 'Science', 'English'],
      ),
      Student(
        id: '28',
        name: 'Zack Turner',
        className: 'Class C',
        subjects: ['Science'],
      ),
      Student(
        id: '29',
        name: 'Amy Phillips',
        className: 'Class B',
        subjects: ['Mathematics', 'English'],
      ),
      Student(
        id: '30',
        name: 'Ben Morgan',
        className: 'Class A',
        subjects: ['English'],
      ),
    ];
    notifyListeners();
  }
} 