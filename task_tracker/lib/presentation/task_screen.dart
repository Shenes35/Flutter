import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_tracker/api/api.dart';
import 'package:task_tracker/model/task_model.dart';
class TaskPage extends StatefulWidget {
  final TaskModel? task; // If null: new task, else: editing

  const TaskPage({super.key, this.task});

  @override
  State<TaskPage> createState() => _TaskInputPageState();
}

class _TaskInputPageState extends State<TaskPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _descController;
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  bool _completed = false;


  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _titleController = TextEditingController(text: widget.task?.task ?? '');
    _descController = TextEditingController(text: widget.task?.description ?? '');
    _selectedDate = widget.task?.date ?? DateTime(now.year, now.month, now.day);
    _selectedTime = widget.task != null
        ? TimeOfDay(
            hour: int.parse(widget.task!.time.split(":")[0]),
            minute: int.parse(widget.task!.time.split(":")[1]))
        : TimeOfDay.now();
    _completed = widget.task?.completed ?? false;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) setState(() => _selectedTime = picked);
  }

void _submit() async {
  if (_formKey.currentState?.validate() ?? false) {
    final player_id = OneSignal.User.pushSubscription.id;
    if (player_id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Player ID not available yet")),
      );
      return;
    }

    final newTask = TaskModel(
      id: widget.task?.id ?? 0,
      createdAt: widget.task?.createdAt ?? DateTime.now(),
      task: _titleController.text.trim(),
      description: _descController.text.trim(),
      date: _selectedDate,
      time: formatTimeOfDay(_selectedTime),
      completed: _completed,
      UserID: player_id,
    );

    try {await Supabase.instance.client
          .from('Task')
          .insert(newTask.toJson())
          .select();


      // Call your notification sending function here
      await sendPushNotificationadd(newTask.task);

      Navigator.pop(context, newTask);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Insertion failed: $e")),
      );
    }
  }
}


String formatTimeOfDay(TimeOfDay tod) {
  final hour = tod.hour.toString().padLeft(2, '0');
  final minute = tod.minute.toString().padLeft(2, '0');
  return '$hour:$minute:00';
}






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Add Task', style: GoogleFonts.oxanium(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            Text('Title', style: GoogleFonts.oxanium(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Enter task name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (v) => (v == null || v.trim().isEmpty) ? "Title required" : null,
            ),
            const SizedBox(height: 16),
            Text('Description', style: GoogleFonts.oxanium(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextFormField(
              controller: _descController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Enter description",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: _pickDate,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Date",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      child: Text(DateFormat('yyyy-MM-dd').format(_selectedDate)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InkWell(
                    onTap: _pickTime,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Time",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      child: Text(_selectedTime.format(context)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Checkbox(
                  value: _completed,
                  onChanged: (val) => setState(() => _completed = val!),
                  activeColor: Colors.green,
                ),
                Text('Completed', style: GoogleFonts.oxanium(fontWeight: FontWeight.w500, fontSize: 16)),
              ],
            ),
            const SizedBox(height: 22),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, minimumSize: const Size.fromHeight(44)),
              child: Text(widget.task == null ? 'Create Task' : 'Update Task'),
            ),
          ]),
        ),
      ),
    );
  }
}

