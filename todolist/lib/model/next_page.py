
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
