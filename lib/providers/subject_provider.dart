import 'package:flutter/foundation.dart';
import '../models/subject.dart';

class SubjectProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];
  int _nextId = 0;

  List<Subject> get subjects => List.unmodifiable(_subjects);

  List<Subject> get passingSubjects =>
      _subjects.where((s) => s.mark >= 50).toList();

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) return 0;
    final total = _subjects.map((s) => s.mark).reduce((a, b) => a + b);
    return total / _subjects.length;
  }

  String get overallGrade {
    if (_subjects.isEmpty) return '-';
    final avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

  void addSubject(String name, int mark) {
    _subjects.add(Subject(id: _nextId++, name: name, mark: mark));
    notifyListeners();
  }

  void removeSubject(int id) {
    _subjects.removeWhere((s) => s.id == id);
    notifyListeners();
  }
}
