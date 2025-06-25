import 'package:flutter/material.dart';
import 'package:day5/model/todo_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final _formKey = GlobalKey<FormState>();
  final entry = TextEditingController();
  int todoCounter = 0;

  bool isEditing = false;
  int? editingIndex;

  final List<TodoModel> _tasks = [
    TodoModel(todoId: '1', todoName: 'Buy groceries', todoStatus: '0'),
    TodoModel(todoId: '2', todoName: 'Walk the dog', todoStatus: '1'),
    TodoModel(todoId: '3', todoName: 'Finish homework', todoStatus: '0'),
    TodoModel(todoId: '4', todoName: 'Call mom', todoStatus: '0'),
  ];

  void addTodo() {
    if (_formKey.currentState!.validate()) {
      todoCounter++;
      TodoModel newTask = TodoModel(
        todoId: todoCounter.toString(),
        todoName: entry.text,
        todoStatus: '0',
      );
      setState(() {
        _tasks.add(newTask);
        entry.clear();
      });
    }
  }

  void deleteToDo(String todoId) {
    setState(() {
      _tasks.removeWhere((item) => item.todoId == todoId);
    });
  }

  void toggleStatus(TodoModel task) {
    setState(() {
      task.todoStatus = task.todoStatus == '1' ? '0' : '1';
    });
  }

  void saveEdit() {
    if (_formKey.currentState!.validate() && editingIndex != null) {
      setState(() {
        _tasks[editingIndex!] = TodoModel(
          todoId: _tasks[editingIndex!].todoId,
          todoName: entry.text,
          todoStatus: _tasks[editingIndex!].todoStatus,
        );
        entry.clear();
        isEditing = false;
        editingIndex = null;
      });
    }
  }

  void cancelEdit() {
    setState(() {
      isEditing = false;
      editingIndex = null;
      entry.clear();
    });
  }

  void startEditing(int index) {
    setState(() {
      isEditing = true;
      editingIndex = index;
      entry.text = _tasks[index].todoName;
    });
  }

  void goToDetailsPage(TodoModel task) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(task: task),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('ToDo App', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: entry,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Need an entry here';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Enter your task here',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      if (isEditing)
                        Column(
                          children: [
                            IconButton(
                              onPressed: saveEdit,
                              icon: const Icon(Icons.save, color: Colors.green),
                              tooltip: 'Save',
                            ),
                            IconButton(
                              onPressed: cancelEdit,
                              icon: const Icon(Icons.cancel, color: Colors.grey),
                              tooltip: 'Cancel',
                            ),
                          ],
                        )
                      else
                        ElevatedButton(
                          onPressed: addTodo,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                            backgroundColor: Colors.green,
                          ),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return ListTile(
                    onTap: () => toggleStatus(task),
                    leading: Text('${index + 1}'),
                    title: Text(task.todoName),
                    subtitle: Row(
                      children: [
                        Text(
                          task.todoStatus == '1' ? 'Done' : 'Pending',
                          style: TextStyle(
                            color: task.todoStatus == '1' ? Colors.green : Colors.red,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteToDo(task.todoId),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => startEditing(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward, color: Colors.black),
                          tooltip: 'View Details',
                          onPressed: () => goToDetailsPage(task),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final TodoModel task;

  const DetailsPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID: ${task.todoId}", style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text("Name: ${task.todoName}", style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text(
                  "Status: ${task.todoStatus == '1' ? 'Done' : 'Pending'}",
                  style: TextStyle(
                    fontSize: 18,
                    color: task.todoStatus == '1' ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
