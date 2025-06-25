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

  print("enter the 3 double values to find the which is largest:");
  String? Input5 = stdin.readLineSync();
  double value5 = double.parse(Input5!);
  String? Input6 = stdin.readLineSync();
  double value6 = double.parse(Input6!);
  String? Input7 = stdin.readLineSync();
  double value7 = double.parse(Input7!);
  print("Largest number is ${larger(a: value5,b: value6,c: value7)}");
  
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
  else if(b>c && b>c)
}