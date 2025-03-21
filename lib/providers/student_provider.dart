import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentProvider with ChangeNotifier {
  List<Student> _students = [];
  bool _isLoading = false;

  List<Student> get students => _students;
  bool get isLoading => _isLoading;

  Future<void> fetchStudents() async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement actual API call
      await Future.delayed(const Duration(seconds: 1));
      // Mock data
      _students = [
        Student(
          id: '1',
          name: 'John Doe',
          rollNumber: 'R001',
          grade: '10',
          section: 'A',
          parentName: 'Parent Name',
          parentPhone: '1234567890',
          address: 'Sample Address',
          dateOfBirth: DateTime(2005, 1, 1),
          admissionDate: DateTime(2020, 6, 1),
          feeStructure: {
            'tuition': 5000,
            'transport': 1000,
          },
        ),
      ];
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addStudent(Student student) async {
    // TODO: Implement add student logic
    _students.add(student);
    notifyListeners();
  }
} 