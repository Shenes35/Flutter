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
  int? rollNo;
  String? name;
  int? age;
  double? totalMark;
}
void main(){
  List<Student2> student =[ Student(rollNo: )]




  Student s= Student();
  s.name= 'Shenes';
  s.age= 21;
  s.grade='A';
  s.getValue();

  List<Rectangle> rectangles=[];
  int n;
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