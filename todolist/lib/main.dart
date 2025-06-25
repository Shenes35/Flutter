import 'package:flutter/material.dart';
import 'package:todolist/model/todo_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<TodoModel> todoList = [
    TodoModel(todoId: '1', todoName: 'Buy groceries', todoStatus: '0'),
    TodoModel(todoId: '2', todoName: 'Walk the dog', todoStatus: '1'),
    TodoModel(todoId: '3', todoName: 'Finish homework', todoStatus: '0'),
    TodoModel(todoId: '4', todoName: 'Call mom', todoStatus: '0'),
  ];

  final _formkey = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  int editFlag = 0;
  String? editingId;
  final todonamecontroller = TextEditingController();
  int todoCounter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 197, 18, 6),
          leading: const Icon(Icons.arrow_back, color: Colors.white),
          title: const Text(
            'ToDO List',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 308,
                                child: TextFormField(
                                  controller: namecontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Any task is required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter your task here',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.add))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final item = todoList[index];
                    return ListTile(
                      onTap: () => toggleStatus(item), // ✅ FIXED HERE
                      leading: Text('${index + 1}'),
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
                          const Spacer(),
                          
                          IconButton(
                            onPressed: () {
                              setState(() {
                                editFlag = 1;
                                editingId = item.todoId;
                                todonamecontroller.text = item.todoName;
                              });
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                deleteTodo(item.todoId);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
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

  void toggleStatus(TodoModel task) {
    setState(() {
      task.todoStatus = task.todoStatus == '1' ? '0' : '1';
    });
  }

  void changeStatus(String todoId, String currentStatus) {
    for (var item in todoList) {
      if (item.todoId == todoId) {
        item.todoStatus = currentStatus == '0' ? '1' : '0';
        break;
      }
    }
  }
  void goToDetailsPage(TodoModel task) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(task: task),
      ),
    );
  }

}
