import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 12, 12),
        title: Text(
          'Whatsapp',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.qr_code, color: Colors.grey[100]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.camera_alt_outlined, color: Colors.grey[100]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: Colors.grey[100]),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.grey[600]),
              ),
              hintText: 'Ask Meta AI or Search',
              hintStyle: TextStyle(color: Colors.grey[600]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[900],
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/profile.jpeg'),
                  radius: 30,
                ),
                title: Text(
                  'John',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.done_all, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4), // small space between icon and text
                    Text(
                      'How are you?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // shrink column to content height
                    children: [
                      Text(
                        '7.03pm',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4), // space between time and badge
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '3', // number in badge
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/profile.jpeg'),
                  radius: 30,
                ),
                title: Text(
                  'John',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.done_all, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4), // small space between icon and text
                    Text(
                      'How are you?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // shrink column to content height
                    children: [
                      Text(
                        '7.03pm',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4), // space between time and badge
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '3', // number in badge
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/profile.jpeg'),
                  radius: 30,
                ),
                title: Text(
                  'John',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.done_all, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4), // small space between icon and text
                    Text(
                      'How are you?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // shrink column to content height
                    children: [
                      Text(
                        '7.03pm',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4), // space between time and badge
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '3', // number in badge
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/profile.jpeg'),
                  radius: 30,
                ),
                title: Text(
                  'John',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.done_all, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4), // small space between icon and text
                    Text(
                      'How are you?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // shrink column to content height
                    children: [
                      Text(
                        '7.03pm',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4), // space between time and badge
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '3', // number in badge
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/profile.jpeg'),
                  radius: 30,
                ),
                title: Text(
                  'John',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.done_all, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4), // small space between icon and text
                    Text(
                      'How are you?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // shrink column to content height
                    children: [
                      Text(
                        '7.03pm',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4), // space between time and badge
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '3', // number in badge
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/profile.jpeg'),
                  radius: 30,
                ),
                title: Text(
                  'John',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.done_all, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4), // small space between icon and text
                    Text(
                      'How are you?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // shrink column to content height
                    children: [
                      Text(
                        '7.03pm',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4), // space between time and badge
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '3', // number in badge
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/profile.jpeg'),
                  radius: 30,
                ),
                title: Text(
                  'John',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.done_all, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4), // small space between icon and text
                    Text(
                      'How are you?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // shrink column to content height
                    children: [
                      Text(
                        '7.03pm',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4), // space between time and badge
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '3', // number in badge
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/profile.jpeg'),
                  radius: 30,
                ),
                title: Text(
                  'John',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.done_all, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4), // small space between icon and text
                    Text(
                      'How are you?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // shrink column to content height
                    children: [
                      Text(
                        '7.03pm',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4), // space between time and badge
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '3', // number in badge
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/profile.jpeg'),
                  radius: 30,
                ),
                title: Text(
                  'John',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.done_all, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4), // small space between icon and text
                    Text(
                      'How are you?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // shrink column to content height
                    children: [
                      Text(
                        '7.03pm',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4), // space between time and badge
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '3', // number in badge
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
