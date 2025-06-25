import 'package:hive_flutter/adapters.dart';
import 'package:student_management/Core/core.dart';
import 'package:student_management/Model/student_model.dart';

void addStudent(StudentModel s)async{
  final result = await Hive.openBox<StudentModel>('student_db');
  int id = await result.add(s);
  s.id=id.toString();
  await result.put(id,s);
  getAllStudent();
}
void removeStudent(StudentModel s) async {
  if (s.id.isEmpty) return; 
  final studentBox = await Hive.openBox<StudentModel>('student_db');
  final key = int.tryParse(s.id);
  await studentBox.delete(key);
  getAllStudent(); 
  
}

void clearStudentDB() async {
  final studentBox = await Hive.openBox<StudentModel>('student_db');
  await studentBox.clear();
  getAllStudent(); 
}

void editStudent(StudentModel s) async {
  if (s.id.isEmpty) return;

  final studentBox = await Hive.openBox<StudentModel>('student_db');
  final key = int.tryParse(s.id);

  if (key != null && studentBox.containsKey(key)) {
    await studentBox.put(key, s); // Update existing student
    getAllStudent(); // Refresh list
  } else {
    print("Invalid or missing key: ${s.id}");
  }
}

void getAllStudent()async{
  final result =await Hive.openBox<StudentModel>('student_db');
  studentsList.value.clear();
  studentsList.value.addAll(result.values);
  studentsList.notifyListeners();
}
