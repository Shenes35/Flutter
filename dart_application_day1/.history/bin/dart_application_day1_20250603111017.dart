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
  int value2 = int.parse(Input1!);
  print("T ${average(value2)}");
  
}

double converter(int celsius){
  return((celsius * 9 / 5) + 32);
}

