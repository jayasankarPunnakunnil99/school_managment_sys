import 'package:flutter/material.dart';
import 'package:school_management_system/models/staff.dart';

class StaffProvider with ChangeNotifier {
  List<Staff> _staff = [];
  String? selectedDepartment;
  String? selectedRole;

  List<String> get departments => ['Administration', 'Maintenance', 'Library', 'IT Support', 'Accounts'];
  List<String> get roles => ['Administrator', 'Librarian', 'IT Technician', 'Accountant', 'Maintenance Staff'];

  List<Staff> getFilteredStaff() {
    return _staff.where((staff) {
      bool matchesDepartment = selectedDepartment == null || staff.department == selectedDepartment;
      bool matchesRole = selectedRole == null || staff.role == selectedRole;
      return matchesDepartment && matchesRole;
    }).toList();
  }

  void setSelectedDepartment(String? department) {
    selectedDepartment = department;
    notifyListeners();
  }

  void setSelectedRole(String? role) {
    selectedRole = role;
    notifyListeners();
  }

  Future<void> loadStaff() async {
    _staff = [
      Staff(
        id: '1',
        name: 'John Smith',
        department: 'Administration',
        role: 'Administrator',
      ),
      Staff(
        id: '2',
        name: 'Mary Wilson',
        department: 'Library',
        role: 'Librarian',
      ),
      Staff(
        id: '3',
        name: 'David Chen',
        department: 'IT Support',
        role: 'IT Technician',
      ),
      Staff(
        id: '4',
        name: 'Sarah Brown',
        department: 'Accounts',
        role: 'Accountant',
      ),
      Staff(
        id: '5',
        name: 'James Rodriguez',
        department: 'Maintenance',
        role: 'Maintenance Staff',
      ),
      Staff(
        id: '6',
        name: 'Emily Davis',
        department: 'Administration',
        role: 'Administrator',
      ),
      Staff(
        id: '7',
        name: 'Michael Lee',
        department: 'Library',
        role: 'Librarian',
      ),
      Staff(
        id: '8',
        name: 'Lisa Wang',
        department: 'IT Support',
        role: 'IT Technician',
      ),
      Staff(
        id: '9',
        name: 'Robert Taylor',
        department: 'Accounts',
        role: 'Accountant',
      ),
      Staff(
        id: '10',
        name: 'Patricia Martinez',
        department: 'Maintenance',
        role: 'Maintenance Staff',
      ),
      Staff(
        id: '11',
        name: 'Kevin Anderson',
        department: 'Administration',
        role: 'Administrator',
      ),
      Staff(
        id: '12',
        name: 'Jennifer White',
        department: 'Library',
        role: 'Librarian',
      ),
      Staff(
        id: '13',
        name: 'Thomas Garcia',
        department: 'IT Support',
        role: 'IT Technician',
      ),
      Staff(
        id: '14',
        name: 'Nancy Moore',
        department: 'Accounts',
        role: 'Accountant',
      ),
      Staff(
        id: '15',
        name: 'Daniel Jackson',
        department: 'Maintenance',
        role: 'Maintenance Staff',
      ),
      Staff(
        id: '16',
        name: 'Michelle Lewis',
        department: 'Administration',
        role: 'Administrator',
      ),
      Staff(
        id: '17',
        name: 'Christopher Hall',
        department: 'Library',
        role: 'Librarian',
      ),
      Staff(
        id: '18',
        name: 'Amanda Clark',
        department: 'IT Support',
        role: 'IT Technician',
      ),
      Staff(
        id: '19',
        name: 'Joseph Young',
        department: 'Accounts',
        role: 'Accountant',
      ),
      Staff(
        id: '20',
        name: 'Sandra King',
        department: 'Maintenance',
        role: 'Maintenance Staff',
      ),
      Staff(
        id: '21',
        name: 'Steven Wright',
        department: 'Administration',
        role: 'Administrator',
      ),
      Staff(
        id: '22',
        name: 'Margaret Lopez',
        department: 'Library',
        role: 'Librarian',
      ),
      Staff(
        id: '23',
        name: 'Edward Turner',
        department: 'IT Support',
        role: 'IT Technician',
      ),
      Staff(
        id: '24',
        name: 'Carol Phillips',
        department: 'Accounts',
        role: 'Accountant',
      ),
      Staff(
        id: '25',
        name: 'George Hill',
        department: 'Maintenance',
        role: 'Maintenance Staff',
      ),
      Staff(
        id: '26',
        name: 'Betty Scott',
        department: 'Administration',
        role: 'Administrator',
      ),
      Staff(
        id: '27',
        name: 'Donald Green',
        department: 'Library',
        role: 'Librarian',
      ),
      Staff(
        id: '28',
        name: 'Ruth Adams',
        department: 'IT Support',
        role: 'IT Technician',
      ),
      Staff(
        id: '29',
        name: 'Jason Baker',
        department: 'Accounts',
        role: 'Accountant',
      ),
      Staff(
        id: '30',
        name: 'Deborah Nelson',
        department: 'Maintenance',
        role: 'Maintenance Staff',
      ),
    ];
    notifyListeners();
  }
} 