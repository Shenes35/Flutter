import 'package:flutter/material.dart';
import 'package:student_management/Core/core.dart';
import 'package:student_management/Infastructure/db_fuctions.dart';
import 'package:student_management/Model/student_model.dart';




class ScreenStudentHome extends StatelessWidget {
  ScreenStudentHome({super.key});
  final studentNameController = TextEditingController();
  final studentRollNoController = TextEditingController();
  final studentMarksController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    getAllStudent();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Students Management',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .35,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: studentNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Student Name Required';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Student Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: studentRollNoController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Student Roll Number Required';
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Student Roll Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: studentMarksController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Student Marks Required';
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Student Marks',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                StudentModel s=StudentModel(id: '',studentName: studentNameController.text,studentRollNumber: studentRollNoController.text,studentMarks: studentMarksController.text);
                                addStudent(s);
                              }
                            },
                            child: Text('Add Student'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              clearStudentDB();
                            },
                            child: Text('Clear All')
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.indigo),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * .70,
            child: ValueListenableBuilder(
              valueListenable: studentsList,
              builder: (context, newStudentList, child) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    var studentData = newStudentList[index];
                    return ListTile(
                      leading: CircleAvatar(
  backgroundColor: Colors.indigo,
  child: Text(
    studentData.studentName.isNotEmpty ? studentData.studentName[0].toUpperCase() : '?',
    style: TextStyle(color: Colors.white),
  ),
),

                      title: Text(studentData.studentName),
                      subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      
      Row(
        children: [Text('Roll No: ${studentData.studentRollNumber}',style: TextStyle(fontSize: 10)),
          TextButton(
 onPressed: () {
  final _editFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: studentData.studentName);
  final rollController = TextEditingController(text: studentData.studentRollNumber);
  final marksController = TextEditingController(text: studentData.studentMarks);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            'Edit Student',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        content: SizedBox(
          width: 200,
          height: 300,
          child: Form(
            key: _editFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Student Name Required' : null,
                  decoration: InputDecoration(
                    hintText: 'Student Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: rollController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Roll Number Required' : null,
                  decoration: InputDecoration(
                    hintText: 'Roll Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: marksController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Marks Required' : null,
                  decoration: InputDecoration(
                    hintText: 'Marks',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cancel
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if (_editFormKey.currentState!.validate()) {
                final updatedStudent = StudentModel(
                  id: studentData.id,
                  studentName: nameController.text,
                  studentRollNumber: rollController.text,
                  studentMarks: marksController.text,
                );
                editStudent(updatedStudent);
                Navigator.of(context).pop(); // Close the dialog
              }
            },
            child: Text("Save"),
          ),
        ],
      );
    },
  );
},

  child: Text(
    'Edit',
    style: TextStyle(color: Colors.green),
  ),
),

          TextButton(
            onPressed: () {
              
                               removeStudent(studentData);
                              },

            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    ],
  ),
                      trailing: Text(studentData.studentMarks),
                    );//
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: newStudentList.length,
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
