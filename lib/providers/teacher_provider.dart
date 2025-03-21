import 'package:flutter/material.dart';
import 'package:school_management_system/models/teacher.dart';

class TeacherProvider with ChangeNotifier {
  List<Teacher> _teachers = [];
  String? selectedDepartment;
  String? selectedSubject;

  List<String> get departments => ['Science', 'Mathematics', 'English', 'History', 'Computer Science'];
  List<String> get subjects => ['Physics', 'Chemistry', 'Biology', 'Mathematics', 'English Literature', 'World History', 'Programming'];

  List<Teacher> getFilteredTeachers() {
    return _teachers.where((teacher) {
      bool matchesDepartment = selectedDepartment == null || teacher.department == selectedDepartment;
      bool matchesSubject = selectedSubject == null || teacher.subjects.contains(selectedSubject);
      return matchesDepartment && matchesSubject;
    }).toList();
  }

  void setSelectedDepartment(String? department) {
    selectedDepartment = department;
    notifyListeners();
  }

  void setSelectedSubject(String? subject) {
    selectedSubject = subject;
    notifyListeners();
  }

  Future<void> loadTeachers() async {
    _teachers = [
      Teacher(
        id: '1',
        name: 'Dr. Sarah Johnson',
        department: 'Science',
        subjects: ['Physics', 'Chemistry'],
        qualification: 'Ph.D. in Physics',
      ),
      Teacher(
        id: '2',
        name: 'Prof. Michael Brown',
        department: 'Mathematics',
        subjects: ['Mathematics'],
        qualification: 'M.Sc. Mathematics',
      ),
      Teacher(
        id: '3',
        name: 'Dr. Emma Wilson',
        department: 'English',
        subjects: ['English Literature'],
        qualification: 'Ph.D. in English Literature',
      ),
      Teacher(
        id: '4',
        name: 'Prof. James Anderson',
        department: 'History',
        subjects: ['World History'],
        qualification: 'Ph.D. in History',
      ),
      Teacher(
        id: '5',
        name: 'Dr. David Chen',
        department: 'Computer Science',
        subjects: ['Programming'],
        qualification: 'Ph.D. in Computer Science',
      ),
      Teacher(
        id: '6',
        name: 'Prof. Lisa Martinez',
        department: 'Science',
        subjects: ['Biology', 'Chemistry'],
        qualification: 'Ph.D. in Biology',
      ),
      Teacher(
        id: '7',
        name: 'Dr. Robert Taylor',
        department: 'Mathematics',
        subjects: ['Mathematics'],
        qualification: 'Ph.D. in Mathematics',
      ),
      Teacher(
        id: '8',
        name: 'Prof. Jennifer White',
        department: 'English',
        subjects: ['English Literature'],
        qualification: 'M.A. in English',
      ),
      Teacher(
        id: '9',
        name: 'Dr. Thomas Garcia',
        department: 'History',
        subjects: ['World History'],
        qualification: 'Ph.D. in History',
      ),
      Teacher(
        id: '10',
        name: 'Prof. Mary Thompson',
        department: 'Computer Science',
        subjects: ['Programming'],
        qualification: 'M.Sc. Computer Science',
      ),
      Teacher(
        id: '11',
        name: 'Dr. William Lee',
        department: 'Science',
        subjects: ['Physics'],
        qualification: 'Ph.D. in Physics',
      ),
      Teacher(
        id: '12',
        name: 'Prof. Patricia Moore',
        department: 'Mathematics',
        subjects: ['Mathematics'],
        qualification: 'M.Sc. Mathematics',
      ),
      Teacher(
        id: '13',
        name: 'Dr. Elizabeth Clark',
        department: 'English',
        subjects: ['English Literature'],
        qualification: 'Ph.D. in Literature',
      ),
      Teacher(
        id: '14',
        name: 'Prof. Richard Wright',
        department: 'History',
        subjects: ['World History'],
        qualification: 'M.A. History',
      ),
      Teacher(
        id: '15',
        name: 'Dr. Susan Lopez',
        department: 'Computer Science',
        subjects: ['Programming'],
        qualification: 'Ph.D. Computer Science',
      ),
      Teacher(
        id: '16',
        name: 'Prof. Joseph King',
        department: 'Science',
        subjects: ['Chemistry', 'Biology'],
        qualification: 'Ph.D. Chemistry',
      ),
      Teacher(
        id: '17',
        name: 'Dr. Margaret Adams',
        department: 'Mathematics',
        subjects: ['Mathematics'],
        qualification: 'Ph.D. Mathematics',
      ),
      Teacher(
        id: '18',
        name: 'Prof. Charles Baker',
        department: 'English',
        subjects: ['English Literature'],
        qualification: 'M.A. English',
      ),
      Teacher(
        id: '19',
        name: 'Dr. Dorothy Nelson',
        department: 'History',
        subjects: ['World History'],
        qualification: 'Ph.D. History',
      ),
      Teacher(
        id: '20',
        name: 'Prof. Christopher Hall',
        department: 'Computer Science',
        subjects: ['Programming'],
        qualification: 'M.Sc. Computer Science',
      ),
      Teacher(
        id: '21',
        name: 'Dr. Betty Scott',
        department: 'Science',
        subjects: ['Physics', 'Chemistry'],
        qualification: 'Ph.D. Physics',
      ),
      Teacher(
        id: '22',
        name: 'Prof. Daniel Green',
        department: 'Mathematics',
        subjects: ['Mathematics'],
        qualification: 'M.Sc. Mathematics',
      ),
      Teacher(
        id: '23',
        name: 'Dr. Sandra Hill',
        department: 'English',
        subjects: ['English Literature'],
        qualification: 'Ph.D. Literature',
      ),
      Teacher(
        id: '24',
        name: 'Prof. George Turner',
        department: 'History',
        subjects: ['World History'],
        qualification: 'M.A. History',
      ),
      Teacher(
        id: '25',
        name: 'Dr. Ruth Phillips',
        department: 'Computer Science',
        subjects: ['Programming'],
        qualification: 'Ph.D. Computer Science',
      ),
      Teacher(
        id: '26',
        name: 'Prof. Edward Young',
        department: 'Science',
        subjects: ['Biology'],
        qualification: 'Ph.D. Biology',
      ),
      Teacher(
        id: '27',
        name: 'Dr. Carol Lewis',
        department: 'Mathematics',
        subjects: ['Mathematics'],
        qualification: 'Ph.D. Mathematics',
      ),
      Teacher(
        id: '28',
        name: 'Prof. Jason Cooper',
        department: 'English',
        subjects: ['English Literature'],
        qualification: 'M.A. English',
      ),
      Teacher(
        id: '29',
        name: 'Dr. Donald Ross',
        department: 'History',
        subjects: ['World History'],
        qualification: 'Ph.D. History',
      ),
      Teacher(
        id: '30',
        name: 'Prof. Michelle Parker',
        department: 'Computer Science',
        subjects: ['Programming'],
        qualification: 'M.Sc. Computer Science',
      ),
    ];
    notifyListeners();
  }
} 