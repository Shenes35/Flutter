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

  h.sayHello();

  // Calling method from Human
  h.sayName();
}