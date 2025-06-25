class Student {
  final int roll;
  final String name;
  final int total;

  Student({required this.roll, required this.name, required this.total});

  @override
  String toString() {
    return 'Roll: $roll, Name: $name, Total: $total';
  }
}

void main() {
  List<Student> myStudents = [];

  Student s1 = Student(roll: 1, name: 'A', total: 80);
  myStudents.add(s1);
  print(myStudents[0]);
  for (var doc in myStudents){
    print(doc.roll);
  }  
}
