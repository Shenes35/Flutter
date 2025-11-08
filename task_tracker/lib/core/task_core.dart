import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_tracker/model/task_model.dart';

class TaskCore {
  final SupabaseClient _client;

  TaskCore(this._client);

  Stream<List<TaskModel>> getTasksStream() {
    return _client
        .from('tasks')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((eventList) => eventList.map((json) => TaskModel.fromJson(json)).toList());
  }

  Future<List<TaskModel>> fetchTasks() async {
  try {
    final data = await _client.from('tasks').select();
    return (data as List).map((json) => TaskModel.fromJson(json)).toList();
  } catch (error) {
    // Handle or rethrow error
    throw error;
  }
}


  Future<void> updateTaskCompletion(String id, bool isCompleted) async {
    final response = await _client.from('tasks').update({'isCompleted': isCompleted}).eq('id', id);
    if (response.error != null) {
      throw response.error!;
    }
  }

  Future<void> insertTask(TaskModel task) async {
    final response = await _client.from('tasks').insert(task.toJson());
    if (response.error != null) {
      throw response.error!;
    }
  }

  Future<void> deleteTask(String id) async {
    final response = await _client.from('tasks').delete().eq('id', id);
    if (response.error != null) {
      throw response.error!;
    }
  }
}
