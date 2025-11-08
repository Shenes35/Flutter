import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Center(
        child: Text('Details for Task ID: '),
      ),
    );
  }
}