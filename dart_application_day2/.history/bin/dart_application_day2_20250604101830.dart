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
    
    print('Human says Hello');
  }
}

void main() {
  Animal h = Human();

  h.sayHello();

  h.sayName();
}