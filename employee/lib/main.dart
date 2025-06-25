import 'package:employee/employee_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Employee_Screen(), // A separate widget class
    );
  }
}

class Employee_Screen extends StatefulWidget {
  const Employee_Screen({super.key});

  @override
  State<Employee_Screen> createState() => _Employee_ScreenState();
}

class _Employee_ScreenState extends State<Employee_Screen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final salaryController = TextEditingController();
  String? selectedDepartment;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[700],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,size: 28),
            onPressed: () {
              // Handle back navigation here
              // Example: Navigator.pop(context);
            },
          ),
          title: Text('Employee details',style: TextStyle(color: Colors.white)),
          actions: [IconButton(
            icon: Icon(Icons.logout_outlined, color: Colors.white,size: 28),
            onPressed: () {
            },
          ),
          ],
        ),
        body: Wrap(
          children: [Form( 
          key: _formKey,
          child: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(controller: nameController,decoration: InputDecoration(hintText: 'Employee Name',border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12))),
                      validator: (value){if (value == null || value.isEmpty) {
              return 'Employee name is required';
            }
            return null;}),),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(controller: idController,decoration: InputDecoration(hintText: 'Employee ID',border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)))
            ,validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Employee ID required';
                  }
                  return null;
                },),),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: 'Select a Department'
                  ),
                  items: ['None','Some'].map((dept) {
                    return DropdownMenuItem<String>(
                      value: dept,
                      child: Text(dept),
                    );
                  }).toList(),
                  onChanged: (value){
                    print(value);
                  },
                  validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a department';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(controller: salaryController,decoration: InputDecoration(hintText: 'Basic Salary',border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)))
              ,validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Salary is required';
                  }
                  return null;
                },),
            ),
            SizedBox(height: 15),
            SizedBox(width: 350,
            child: ElevatedButton(onPressed: (){if (_formKey.currentState!.validate()) {double bs = double.parse(
                        salaryController.text
                      );
                      double hra = bs * .40;
                      double ta = bs * .15;
                      double da = bs * .50;
                      double netSalary = bs + hra + da + ta;
Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => pay_slip(employeeName: nameController.text, employeeId: idController.text, employeeDepartment: selectedDepartment.toString(), basicSalary: salaryController.text, da: da.toString(), hra:hra.toString(), ta: ta.toString(), netSalary: netSalary.toString()),),);}},style: ElevatedButton.styleFrom(backgroundColor: Colors.pink), child: Text('Process',style: TextStyle(color: Colors.white,fontSize: 20))))
          ]
        )
        )
        ],)
      );
  }
}
