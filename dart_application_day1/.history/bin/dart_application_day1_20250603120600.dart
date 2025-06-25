import 'dart:io';
void main() {
  int myInt = 42;
  double myDouble = 3.14;
  String myString = "Hello, Dart!";
  bool myBool = true;
  var myVar = "This is a var type"; 


  print("Integer value: $myInt");
  print("Double value: $myDouble");
  print("String value: $myString");
  print("Boolean value: $myBool");
  print("Var value: $myVar");
  
  print("enter the Celsius value");
  String? Input = stdin.readLineSync();
  int value = int.parse(Input!);
  print("The celsius value converted to Farenheit is ${converter(value)}");

  print("enter the 3 double values to find the average:");
  String? Input1 = stdin.readLineSync();
  double value1 = double.parse(Input1!);
  String? Input2 = stdin.readLineSync();
  double value2 = double.parse(Input2!);
  String? Input3 = stdin.readLineSync();
  double value3 = double.parse(Input3!);
  print("Average is ${average(a: value1,b: value2,c: value3)}");

  print("Enter the number to check whether it is odd or even:");
  String? Input4 = stdin.readLineSync();
  int value4 = int.parse(Input4!);
  print("The number is:${checker(value: value4)}");

  print("enter the 3 double values to find the which is largest(all number should be independent):");
  String? Input5 = stdin.readLineSync();
  double value5 = double.parse(Input5!);
  String? Input6 = stdin.readLineSync();
  double value6 = double.parse(Input6!);
  String? Input7 = stdin.readLineSync();
  double value7 = double.parse(Input7!);
  print("Largest number is ${larger(a: value5,b: value6,c: value7)}");

  print("Enter the number to check whether it is odd or even using ternery operator:");
  String? Input8 = stdin.readLineSync();
  int value8 = int.parse(Input8!);
  print("The number is:${checkerternery(value: value8)}");

  print("enter the 3 double values to find the which is largest(all number should be independent):");
  String? Input9 = stdin.readLineSync();
  double value9 = double.parse(Input9!);
  String? Input10 = stdin.readLineSync();
  double value10 = double.parse(Input10!);
  String? Input11 = stdin.readLineSync();
  double value11 = double.parse(Input11!);
  print("Largest number is ${largerternery(a: value9,b: value10,c: value11)}");

  looper();

  loopereven();

  print("enter the number to find square:");
  String? Input12 = stdin.readLineSync();
  double value12 = double.parse(Input12!);
  print("The square of the number is ${square(value : value12)}");
  
  print("enter the number to find factorial:");
  String? Input13 = stdin.readLineSync();
  int value13 = int.parse(Input13!);
  print("The factorial of the number is ${factorial(value : value13)}");

  print("enter the 2 numbers to find sum:");
  String? Input14 = stdin.readLineSync();
  double value14 = double.parse(Input14!);
  String? Input15 = stdin.readLineSync();
  double value15 = double.parse(Input15!);
  print("The sum of the numbers is ${sum(value1 : value14,value2 : value15)}");

  print("enter your name,age and:");
  String? Input14 = stdin.readLineSync();
  double value14 = double.parse(Input14!);
  String? Input15 = stdin.readLineSync();
  double value15 = double.parse(Input15!);
  print("The sum of the numbers is ${sum(value1 : value14,value2 : value15)}");
}

double converter(int celsius){
  return((celsius * 9 / 5) + 32);
}

double average({required double a,required double b,required double c }){
  return(a + b + c /3);
}

String checker({required int value}){
  if(value==0){
    return "Not even not odd";
  }else if(value % 2==0){
    return "Even";
  }
  else{
    return "Odd";
  }
  
}

String larger({required double a, required double b, required double c }){
  if(a>b && a>c){
    return "1st number";
  }
  else if(b>a && b>c){
    return "2nd number";
  }
  else {
    return "2nd number";
  }
}

String checkerternery({required int value}){
  return value%2==0 ? "Even" : value==0? "not even not odd": "odd";
}

String largerternery({required double a,required double b,required double c}){
  return a>b && a>c ? "1st Number" : b>a && b>c ? "2nd Number" : "3rd Number";
}

void looper(){
  int i=0;
  print("Number btw 1 and 10:");
  for(i=0;i<=10;i++){
    stdout.write("$i ");
  }
}

void loopereven(){
  print("Even numbers btw 1 and 50");
  int i=2;
  for(i=2;i<=50;i++){
    stdout.write("$i ");
    i++;
  }
}

double square({required double value}){
  return value*value;
}

int factorial({required int value}){
  if(value==0 || value==1){
    return 1;
  }
  else
    return value*factorial(value:value -1);
}

double sum({required double value1,required double value2}){
  return value1+value2;
}