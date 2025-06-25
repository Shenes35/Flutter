void main(){
  List<int> myList =[1,2,2,3,4,5,6,7];
  print(myList.length);
  myList.add(5);
  print(myList);
  myList.addAll([5,4,3,2]);
  print(myList);
  myList.remove(2);
  print(myList);
  myList.removeAt(3);
  print(myList);
  myList.removeWhere((test)=>test==2 );
  print(myList);
  print(myList.contains(2));
  myList.clear();
  print(myList);
  myList.sort();
  print(myList);
  myLIst.sort((a,b){ return.compareTo(a)})
}