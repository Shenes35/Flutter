import 'dart:io';
import 'dart:math';

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
class Person{
  String? name;
  int? age;

  Person({required String name,required int age});
  void display(){
    print("Name :$name and age:$age");
  }

}

class Animal{
  void makeSound(){
    print("Animal is making sound");
  }
}

class Dog extends Animal{
  @override
  void makesound(){
    print("Animal is making woof woof sound");
  }
}

class Cat extends Animal{
  @override
  void makesound(){
    print("Animal is making meow meow sound");
  }
}

class Vehicle{
  int? year;
  String? brand;
  Vehicle({required String brand,required int year});
  void display(){
    print("Brand:$brand,Year:$year");
  }
}

class Car extends Vehicle{
  String? model;
  String? fuelType;
  Car({required String brand,required int year,required this.model,required this.fuelType }): super(brand: brand,year: year);

  @override
  void display(){
    super.display();
    print("Model: $model,FuelType: $fuelType");
  }
}
class Shape{
  double area(){
    return 0;
  }
}
class Rectangle2 extends Shape{
  double length;
  double breadth;
  Rectangle2({required this.length,required this.breadth});
  double area(){
    return length * breadth;
  }
}

class Circle2 extends Shape{
  double radius;
  Circle2({required this.radius});
  double area(){
    return pi * radius * radius;
  }
}
void main(){
  List<int> numbers=[];
  print("Enter the 5 numbers:");
  for(int i=0;i<5;i++){
    stdout.write('Enter number ${i + 1}: ');
    int num = int.parse(stdin.readLineSync()!); 
    numbers.add(num);
  }
  print("List is: $numbers");
  print("Enter an element to add to the end of the list:");
  int num = int.parse(stdin.readLineSync()!); 
  numbers.add(num);
  print("New List is: $numbers");
  print("Enter an element to add and the index of the list:");
  int num1 = int.parse(stdin.readLineSync()!); 
  int num2 = int.parse(stdin.readLineSync()!); 
  numbers.insert(num2,num1);
  print("New List is: $numbers");
  print("Enter an element to remove from the list:");
  int num3 = int.parse(stdin.readLineSync()!); 
  numbers.remove(num3);
  print("New List is: $numbers");
  print("Length of the list is: ${numbers.length},The List is: $numbers");
  print("Enter an index to access from the list:");
  int num4 = int.parse(stdin.readLineSync()!); 
  int element=numbers[num4];
  print("The element is:$element");

  List<String> strings=[];
  print("Enter the number of string required:");
  int num5=int.parse(stdin.readLineSync()!);
  for(int i=0;i<num5;i++){
    stdout.write('Enter elements ${i + 1}: ');
    String element = stdin.readLineSync()!; 
    strings.add(element);
  }
  strings.sort();
  print("Sorted list is: $strings");
  print("Printing using forloop:");
  for (var ele in strings) {
    print('Element: $ele');
  }
  
  int sum=0;
  for(int i=0;i<numbers.length;i++){
    sum+=numbers[i];
  }
  print("Sum of elements in the previous integer list:$sum");

  print("Enter the element to check whether present or not:");
  String element1=stdin.readLineSync()!;
  print("Element is present in the list statement is ${strings.contains(element1)}");

  List<int> reversedList = numbers.reversed.toList();
  print('Original list: $numbers');
  print('Reversed list: $reversedList');

  print("Enter the radius of the circle and length and breadth of the rectangle:");
  double radius=double.parse(stdin.readLineSync()!);
  double length=double.parse(stdin.readLineSync()!);
  double breadth=double.parse(stdin.readLineSync()!);
  Rectangle2 r2=Rectangle2(length: length,breadth: breadth);
  Circle2 c3=Circle2(radius: radius);
  print("Area of rectangle: ${r2.area()},Area of Circle: ${c3.area()}");

  print('Enter the brand,year,model and fuel type:');
  String brand=stdin.readLineSync()!;
  int year=int.parse(stdin.readLineSync()!);
  String model=stdin.readLineSync()!;
  String fuelType=stdin.readLineSync()!;

  Car c2= Car(brand: brand,year: year,model: model,fuelType: fuelType);
  c2.display();

  Animal a1=Animal();
  Dog d1=Dog();
  Cat c1=Cat();

  a1.makeSound();
  d1.makeSound();
  c1.makeSound();




  print("Enter the name:");
  String name=stdin.readLineSync()!;

  print("Enter the age:");
  int age=int.parse(stdin.readLineSync()!);
  Person p1= Person(name: name,age: age);
  p1.display();



  List<Student2> studentList =[ 
    Student2(rollNo : 1,name : 'Shenes', age : 21, totalMark : 97),
    Student2(rollNo : 2,name : 'Rohith', age : 21, totalMark : 99),
    Student2(rollNo : 3,name : 'Yedhu', age : 21, totalMark : 100)];
    Set<int> seen = {};
    studentList.retainWhere((stu) => seen.add(stu.rollNo));
    print("Initial Student List:");
    studentList.forEach((student) => print(student));

    //Add
    int? n;
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

      print("Enter the totslmark:");
      double totalMark = double.parse(stdin.readLineSync()!);

      Student2 newStudent = Student2(
      rollNo: rollNo,
      name: name,
      age: age,
      totalMark: totalMark,
      );
      studentList.add(newStudent);
    }
    Set<int> seen2 = {};
    studentList.retainWhere((stu) => seen2.add(stu.rollNo));
    studentList.forEach((student) => print(student));

    //Edit
    print("How many students to be edited:");
    n = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < n; i++) {
      print("Enter the unique roll no:");
      int rollNo = int.parse(stdin.readLineSync()!);

      for (var student in studentList) {
        if (student.rollNo == rollNo) {
          print("Enter the name:");
          String name = stdin.readLineSync()!;

          print("Enter the age:");
          int age = int.parse(stdin.readLineSync()!);

          print("Enter the totalmark:");
          double totalMark = double.parse(stdin.readLineSync()!);

          student.name = name;
          student.age = age;
          student.totalMark = totalMark;
          break;
    
        }
      }
    }
    Set<int> seen3 = {};
    studentList.retainWhere((stu) => seen3.add(stu.rollNo));
    studentList.forEach((student) => print(student));

    //Delete
    print("How many students to be deleted:");
    n = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < n; i++) {
      print("Enter the unique roll no:");
      int rollNo = int.parse(stdin.readLineSync()!);

      studentList.removeWhere((student) => student.rollNo == rollNo);

    }
    studentList.forEach((student) => print(student));



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