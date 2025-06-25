class Animal{
  void sayHello(){
    print('Animal says Hello');
  }
}

class Human extends Animal{
  void sayname(){
    print('Human says the name');
  }
}

void main() {
  Human h = Human();

  // Calling inherited method from Animal
  h.sayHello();

  // Calling method from Human
  h.sayName();
}