import 'package:flutter/material.dart';
import 'dart:io';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Wrap(
              children: [
                GestureDetector(
                  onTap: () {
                    print('Icons tapped!');
                  },
                  child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.more_vert,
                        size: 30,
                        color: Colors.orange,
                      ),
                      Transform.translate(
                        offset: const Offset(-13, 0),
                        child: const Icon(
                          Icons.menu_rounded,
                          size: 35,
                          color: Colors.orange,
                          ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 130,
                    width: 400,
                  ),
                  TextFormField(
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 40,       // <-- This controls the size of the typed text
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none, // Removes border when focused
                    ),
                  ),
                  
                  TextFormField(
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 60,       // <-- This controls the size of the typed text
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none, // Removes border when focused
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                                // Your action here
                            },
                            fillColor: Colors.grey,
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              'AC',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: Colors.grey,
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '+/-',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: Colors.grey,
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '%',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: Colors.orange,
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '÷',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Column(
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  // Your action here
                                },
                                fillColor: const Color.fromARGB(255, 32, 30, 30),
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                  width: 80.0,
                                  height: 80.0,
                                ),
                                child: Text(
                                  '7',
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              
                            ],
                            
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: const Color.fromARGB(255, 32, 30, 30),
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '8',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: const Color.fromARGB(255, 32, 30, 30),
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '9',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: Colors.orange,
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '×',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Column(
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  // Your action here
                                },
                                fillColor: const Color.fromARGB(255, 32, 30, 30),
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                  width: 80.0,
                                  height: 80.0,
                                ),
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: const Color.fromARGB(255, 32, 30, 30),
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '5',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: const Color.fromARGB(255, 32, 30, 30),
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '6',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: Colors.orange,
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '–',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Column(
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  // Your action here
                                },
                                fillColor: const Color.fromARGB(255, 32, 30, 30),
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                  width: 80.0,
                                  height: 80.0,
                                ),
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: const Color.fromARGB(255, 32, 30, 30),
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '2',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: const Color.fromARGB(255, 32, 30, 30),
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '3',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: Colors.orange,
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Column(
                            children: [
                              RawMaterialButton(
  onPressed: () {
    // Action
  },
  fillColor: const Color.fromARGB(255, 32, 30, 30),
  shape: const CircleBorder(),
  constraints: const BoxConstraints.tightFor(
    width: 80.0,
    height: 80.0,
  ),
  
    child: Image.asset(
      'assets/calculator.png',
      width: 24,
      height: 35,
      fit: BoxFit.cover,
  ),
),
                            ],
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: const Color.fromARGB(255, 32, 30, 30),
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '0',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: const Color.fromARGB(255, 32, 30, 30),
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '.',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          RawMaterialButton(
                            onPressed: () {
                              // Your action here
                            },
                            fillColor: Colors.orange,
                            shape: CircleBorder(),
                            constraints: BoxConstraints.tightFor(
                              width: 80.0,
                              height: 80.0,
                            ),
                            child: Text(
                              '=',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}