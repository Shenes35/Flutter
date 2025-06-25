class Student {
  final int roll;
  final String name;
  final int total;

  Student({required this.roll, required this.name, required this.total});
}

void main() {
  List<Student> myStudents = [];

  Student s1 = Student(roll: 1, name: 'A', total: 80);
  myStudents.add(s1);

  print(myStudents[0].name);  // Output: A
}
