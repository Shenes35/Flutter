import 'package:flutter/material.dart';

class CounterHome extends StatefulWidget {
  const CounterHome({super.key});

  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        backgroundColor: Colors.blue
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('You have pressed the button'),
        Text(counter.toString())] 
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: FloatingActionButton(onPressed: (){
              setState(() {
                counter=counter+1;
              }); 
            },child: Icon(Icons.remove)),
          ),
          FloatingActionButton(onPressed: (){
            ValueNotifier(() {
              counter=counter+1;
            }); 
          },child: Icon(Icons.add)),
        ],
      ),
    );
  }
}