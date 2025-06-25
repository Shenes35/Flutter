import 'package:flutter/material.dart';
import 'package:student_management/Model/student_model.dart';



ValueNotifier<List<StudentModel>> studentsList = ValueNotifier([
  StudentModel(
    id: '1',
    studentName: 'Alice Johnson',
    studentRollNumber: 'R001',
    studentMarks: '85',
  ),
  StudentModel(
    id: '2',
    studentName: 'Bob Smith',
    studentRollNumber: 'R002',
    studentMarks: '78',
  ),
  StudentModel(
    id: '3',
    studentName: 'Charlie Davis',
    studentRollNumber: 'R003',
    studentMarks: '92',
  ),
  StudentModel(
    id: '4',
    studentName: 'Diana Moore',
    studentRollNumber: 'R004',
    studentMarks: '88',
  ),
  StudentModel(
    id: '5',
    studentName: 'Ethan Brown',
    studentRollNumber: 'R005',
    studentMarks: '74',
  ),
  StudentModel(
    id: '6',
    studentName: 'Fiona Clark',
    studentRollNumber: 'R006',
    studentMarks: '90',
  ),
  StudentModel(
    id: '7',
    studentName: 'George Allen',
    studentRollNumber: 'R007',
    studentMarks: '81',
  ),
  StudentModel(
    id: '8',
    studentName: 'Hannah Lee',
    studentRollNumber: 'R008',
    studentMarks: '95',
  ),
  StudentModel(
    id: '9',
    studentName: 'Ian Walker',
    studentRollNumber: 'R009',
    studentMarks: '67',
  ),
  StudentModel(
    id: '10',
    studentName: 'Julia Scott',
    studentRollNumber: 'R010',
    studentMarks: '89',
  ),
  StudentModel(
    id: '11',
    studentName: 'Kevin Hall',
    studentRollNumber: 'R011',
    studentMarks: '76',
  ),
  StudentModel(
    id: '12',
    studentName: 'Laura Young',
    studentRollNumber: 'R012',
    studentMarks: '82',
  ),]);