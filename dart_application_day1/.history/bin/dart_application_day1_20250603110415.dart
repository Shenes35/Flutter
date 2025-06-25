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
  String? CelsiusInput = stdin.readLineSync();
  int value = int.parse(CelsiusInput!);
  print("The celsius value converted to Farenheit is"converter(value));
  
}

void converter(int celsius){
  return()
}

