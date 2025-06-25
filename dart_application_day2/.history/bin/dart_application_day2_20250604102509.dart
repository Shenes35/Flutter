void main(){
  List<int> myList =[1,2,3,4,5,6,7];
  print(myList.length);
  myList.add(5);
  print(myList);
  myList.addAll([5,4,3,2]);
  myList.remove(2);
  myList.removeAt(3);
  print(myList);
}