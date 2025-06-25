abstract class Animal{
  void sayHello();
}

class Human extends Animal{
  void sayName(){
    print('Human says the name');
  }
  @override
  void sayHello(){
    print('Human says Hello');
  }
}

void main() {
  Animal h = Animal();

  h.sayHello();

  h.sayName();
}