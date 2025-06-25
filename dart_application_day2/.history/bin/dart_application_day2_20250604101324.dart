class Animal{
  void sayHello(){
    print('Animal says Hello');
  }
}

class Human extends Animal{
  void sayName(){
    print('Human says the name');
  }
  @override
  void sayHello(){
    super.sayHello
    print('Human says Hello');
  }
}

void main() {
  Human h = Human();

  h.sayHello();

  h.sayName();
}