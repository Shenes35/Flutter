import 'dart:io';
class Student{
  String? name;
  int? age;
  String? grade;

  void getValue() {
  print('Name: $name, Age: $age, Grade: $grade');
  }
}

class Rectangle{
  int? length;
  int? breadth;

  void area(){
    print('Area is:${length!*breadth!}');
  }
  void perimeter(){
    print('Perimeter is:${2*(length!+breadth!)}');
  }
}

class Student2{
  int rollNo;
  String name;
  int age;
  double totalMark;

  Student2({required this.rollNo,required this.name, required this.age, required this.totalMark});

  @override
  String toString() {
    return 'RollNo: $rollNo, Name: $name, Age: $age, Total Marks: $totalMark';
  }
}
void main(){
  List<Student2> studentList =[ 
    Student2(rollNo : 1,name : 'Shenes', age : 21, totalMark : 97),
    Student2(rollNo : 2,name : 'Rohith', age : 21, totalMark : 99),
    Student2(rollNo : 3,name : 'Yedhu', age : 21, totalMark : 100)];
    Set<int> seen = {};
    studentList.retainWhere((stu) => seen.add(stu.rollNo));
    print("Initial Student List:");
    studentList.forEach((student) => print(student));

    //Add
    
    }

    print("How many students to be created:");
    n = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < n; i++) {
      print("\nEnter details for student ${i + 1}:");
      print("Enter the unique roll no:");
      int rollNo = int.parse(stdin.readLineSync()!);

      print("Enter the name:");
      String name = stdin.readLineSync()!;

      print("Enter the age:");
      int age = int.parse(stdin.readLineSync()!);

      print("Enter the name:");
      double totalMark = double.parse(stdin.readLineSync()!);

      Student2 newStudent = Student2(
      rollNo: rollNo,
      name: name,
      age: age,
      totalMark: totalMark,
      );
      studentList.add(newStudent);
    }




  Student s= Student();
  s.name= 'Shenes';
  s.age= 21;
  s.grade='A';
  s.getValue();

  List<Rectangle> rectangles=[];
  print("How many rectangles to be created:");
  n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    Rectangle r=Rectangle();
    print("Enter the length:");
    r.length = int.parse(stdin.readLineSync()!);

    print("Enter the breadth:");
    r.breadth = int.parse(stdin.readLineSync()!);
    rectangles.add(r);
  }
  for (int i = 0; i < n; i++) {
    rectangles[i].area();
    rectangles[i].perimeter();
  }

}