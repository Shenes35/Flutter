import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _formKey = GlobalKey<FormState>();
  List<TodoModel> todoList = [];

  int editFlag = 0;
  String? editingId;
  final todonamecontroller = TextEditingController();
  int todoCounter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text(
            'ToDO List',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 201, 25, 25),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 10),
                  SizedBox(
                    width: 300,
                    height: 60,
                    child: TextFormField(
                      controller: todonamecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Any task is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        hintText: 'Enter your task here',
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 201, 25, 25)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              if (editFlag == 0) {
                                todoCounter++;
                                TodoModel t = TodoModel(
                                  todoId: todoCounter.toString(),
                                  todoName: todonamecontroller.text,
                                  todoStatus: '0',
                                );
                                addTodo(t);
                              } else {
                                updateTodo(editingId!, todonamecontroller.text);
                                editFlag = 0;
                                editingId = null;
                              }
                              todonamecontroller.clear();
                            });
                          }
                        },
                        icon: Icon(
                          editFlag == 0 ? Icons.add : Icons.save,
                          color: const Color.fromARGB(255, 201, 25, 25),
                        ),
                        iconSize: 40,
                      ),
                      Visibility(
                        visible: editFlag == 1,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              editFlag = 0;
                              editingId = null;
                              todonamecontroller.clear();
                            });
                          },
                          icon: Icon(Icons.cancel),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final item = todoList[index];
                    return ListTile(
                      
                      leading: Text(
                        '${index + 1}',
                        style: TextStyle(fontSize: 20),
                      ),
                      title: Text(item.todoName),
                      subtitle: Row(
                        children: [
                          Text(
                            item.todoStatus == '0'
                                ? 'Status: Not Completed'
                                : 'Status: Completed',
                            style: TextStyle(
                              color: item.todoStatus == '0'
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                changeStatus(item.todoId, item.todoStatus);
                              });
                            },
                            icon: Icon(Icons.check_circle_outline),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                editFlag = 1;
                                editingId = item.todoId;
                                todonamecontroller.text = item.todoName;
                              });
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                deleteTodo(item.todoId);
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: todoList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addTodo(TodoModel t) {
    todoList.add(t);
  }

  void deleteTodo(String todoId) {
    todoList.removeWhere((item) => item.todoId == todoId);
  }

  void updateTodo(String id, String newName) {
    for (var item in todoList) {
      if (item.todoId == id) {
        item.todoName = newName;
        break;
      }
    }
  }

  void changeStatus(String todoId, String currentStatus) {
    for (var item in todoList) {
      if (item.todoId == todoId) {
        item.todoStatus = currentStatus == '0' ? '1' : '0';
        break;
      }
    }
  }
}