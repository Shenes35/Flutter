class Student{
  String? name;
  int age;
  String grade;

  void getValue() {
  print('Name: $name, Age: $age, Grade: $grade');
  }
}

void main(){
  Student s= Student();
  s.name= 'Shenes';
  s.age= 21;
  s.grade='A';
  s.getValue();
}