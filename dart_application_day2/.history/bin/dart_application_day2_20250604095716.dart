class Person{
  int? age;
  String? name;
  Person({this.age=1,required this.name});
  void showPerson(){
    print(name);
    print(age);
  }
}

void main(){
  Person p=Person(name: 'MITS');
  p.showPerson();
}