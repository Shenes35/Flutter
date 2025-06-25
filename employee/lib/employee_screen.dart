import 'package:employee/main.dart';
import 'package:flutter/material.dart';

class pay_slip extends StatelessWidget {
  final String employeeName;
final String employeeId;
final String employeeDepartment;
final String basicSalary;
final String da;
final String hra;
final String ta;
final String netSalary;
const pay_slip({
    super.key,
    required this.employeeName,
    required this.employeeId,
    required this.employeeDepartment,
    required this.basicSalary,
    required this.da,
    required this.hra,
    required this.ta,
    required this.netSalary,
  });

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[700],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,size: 28),
            onPressed: () {
              Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Employee_Screen(),),);
            },
          ),
          title: Text('Pay Slip',style: TextStyle(color: Colors.white)),
          actions: [IconButton(
            icon: Icon(Icons.logout_outlined, color: Colors.white,size: 28),
            onPressed: () {
            },
          ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10), 
            Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text('Employee Name: $employeeName',style: TextStyle(color: Colors.blueAccent,fontSize: 24)),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text('Employee ID: $employeeId',style: TextStyle(color: Colors.blueAccent,fontSize: 24)),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text('Employee Department: $employeeDepartment',style: TextStyle(color: Colors.blueAccent,fontSize: 24)),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text('Basic Salary: $basicSalary',style: TextStyle(color: Colors.blueAccent,fontSize: 24)),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text('HRA: $hra',style: TextStyle(color: Colors.blueAccent,fontSize: 24)),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text('DA: $da',style: TextStyle(color: Colors.blueAccent,fontSize: 24)),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text('TA: $ta',style: TextStyle(color: Colors.blueAccent,fontSize: 24)),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text('Set Salary: $netSalary',style: TextStyle(color: Colors.blueAccent,fontSize: 24)),
          )]
        )
      )
    );
  }
}