class Person{
  int? _age;
  String? name;
  Person({int? age=1,required this.name}) : _age = age;
  void showPerson(){
    print(name);
    print(_age);
  }
}

void main(){
  Person p=Person(name: 'MITS');
  p.showPerson();
}