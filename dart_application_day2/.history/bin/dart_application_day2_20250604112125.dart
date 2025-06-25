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
  int length;
  int breadth;

  void area(){
    print('Area is:${length*breadth}');
  }
  void perimeter(){
    print('Area is:${2*(length+breadth)}');
  }
}

void main(){
  Student s= Student();
  s.name= 'Shenes';
  s.age= 21;
  s.grade='A';
  s.getValue();

  Rectangle r=Rectangle();
  print("Enter the length:");
  r[i].length = int.parse(stdin.readLineSync()!);

  print("Enter the breadth:");
  r[i].breadth = int.parse(stdin.readLineSync()!);

}