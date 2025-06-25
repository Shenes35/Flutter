class Animal{
  void sayHello(){
    print('Animal says Hello');
  }
}

class Human extends Animal{
  void sayHello(){
    print('Human says the name');
  }
}

void main() {
  Human h = Human();

  h.sayHello();

  h.sayName();
}