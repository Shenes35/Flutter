import 'package:task_tracker/api/api.dart';
import 'package:task_tracker/main.dart';
import 'package:task_tracker/presentation/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:task_tracker/model/task_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:task_tracker/presentation/task_update_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 int _selectedBottomIndex = 0;// 0 = Home, 1 = Analytics, 2 = Notifications, 3 = Profile

  bool _isExpanded = false;
  Stream<List<TaskModel>> getTasksStream() {
  final client = Supabase.instance.client;
  return client
      .from('Task')
      .stream(primaryKey: ['id'])
      .order('created_at')
      .map((list) {
         print('Raw data from Supabase: $list');
         return list.map((json) => TaskModel.fromJson(json)).toList();
      });
}


  

  @override
  void initState() {
    super.initState();
    _selectedBottomIndex = 0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setupNotificationDevice();
    });

  }
  void _deleteTask(int taskId,String title) async {
  try { await Supabase.instance.client
        .from('Task')
        .delete()
        .eq('id', taskId)
        .select();



    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Task deleted successfully")),
    );
     await sendPushNotificationdelete(title);

    setState(() {}); // Refresh UI; stream will auto update task list
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Delete failed: $e")),
    );
  }
}

  Widget _verticalDivider() {
    return Container(
      height: 24,
      width: 1,
      color: Colors.black,
      margin: const EdgeInsets.symmetric(horizontal: 6),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Main content
            Column(
              
  children: [
    _buildDateHeader(),
    
    
     StreamBuilder<List<TaskModel>>(
  stream: getTasksStream(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    }
    if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(child: Text('No tasks available'));
    }

    final tasks = snapshot.data!;
    final totalTasks = tasks.length;
    final completedTasks = tasks.where((task) => task.completed).length;
    final progressPercent = totalTasks == 0 ? 0.0 : completedTasks / totalTasks;
    return Padding(
           padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
           child: Container(
             padding: const EdgeInsets.all(11),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 40, 39, 39), Color.fromARGB(255, 0, 0, 0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
               ),
               boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 12,
              spreadRadius: 1,
            ),
               ],
               
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
            Row(
              children:  [
                
                Expanded(
                  child: Text(
                    "Task \nProgress",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "$completedTasks of $totalTasks tasks completed",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                
              ],
            ),
            const SizedBox(height: 10),
           
            /// ✅ Bar + Left Text Row
            Row(
              children: [
                 Expanded(
                  flex: 6,
                  child: 
                  Text(
             DateFormat('yyyy/MM/dd').format(DateTime.now()),
             style: GoogleFonts.oxanium(
               fontSize: 15,
               fontWeight: FontWeight.w500,
               color: const Color.fromARGB(255, 251, 252, 252),
             ),
           ),
           
           
                ),
                
                Expanded(
             flex: 5,
             child: Stack(
               alignment: Alignment.center, // 🔹 Center everything
               children: [
            // Base bar and progress
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 18,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F1B2B),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
                LayoutBuilder(
  builder: (context, constraints) {
    final filledWidth = constraints.maxWidth * progressPercent;
    final cappedFilledWidth = filledWidth.clamp(0, constraints.maxWidth).toDouble();

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 18,
            decoration: BoxDecoration(
              color: Color(0xFF0F1B2B),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
            ),
          ),
          Container(
            height: 18,
            width: cappedFilledWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 64, 166, 238),
                  Color(0xFF0072FF),
                ],
              ),
            ),
          ),
          // The progress text overlay
          Align(
              alignment: Alignment.center,
              child: Text(
                "${(progressPercent * 100).toInt()}%",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.black,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              )),
          // Optionally comment out this block if you don't want the glowing dot at 100%
          if (progressPercent < 1.0)
            Positioned(
              left: (cappedFilledWidth - 10).clamp(0, constraints.maxWidth - 22),
              child: Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  },
)

              ],
            ),
           
            // 🔹 Centered progress text (always visible)
             Text(
              "${(progressPercent * 100).toInt()}%",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
               ],
             ),
           ),
           
              ],
            ),
               ],
             ),
           ),
         );
  },
),

      Expanded(
  child: StreamBuilder<List<TaskModel>>(
    stream: getTasksStream(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(child: CircularProgressIndicator());
      }
      final tasks = snapshot.data!;
      return ListView.builder(
  padding: const EdgeInsets.fromLTRB(8, 8, 8, 80),
  itemCount: tasks.length,
  itemBuilder: (context, index) {
    final task = tasks[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                gradient: task.completed
        ? const LinearGradient(
            colors: [
              Color.fromARGB(255, 5, 87, 2),          // Light green
              Color.fromARGB(255, 240, 221, 13),          // Even lighter green
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : const LinearGradient(
            colors: [
              Color.fromARGB(255, 40, 39, 39),
              Color.fromARGB(255, 0, 0, 0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      task.task,
                      style: GoogleFonts.oxanium(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 251, 252, 252),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  TextButton(
  onPressed: () async {
    // Pass the current task to TaskPageupdate for editing
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TaskPageupdate(task: task)),
    );
    if (result != null) {
      setState(() {
        // Refresh UI after update
      });
    }
  },
  child: const Text(
    'Update',
    style: TextStyle(color: Color.fromARGB(255, 11, 104, 226)),
  ),
),

                  TextButton(
  onPressed: () => _deleteTask(task.id,task.task),
  child: const Text(
    'Delete',
    style: TextStyle(color: Colors.red),
  ),
),

                  
                  TextButton(
                    onPressed: () async {
                      await Supabase.instance.client
                          .from('Task')
                          .update({'Completed': true})
                          .eq('id', task.id);

                      await sendPushNotificationcomplete(task.task);
                      setState(() {});
                    },
                    child: Text(
                      task.completed ? 'Completed' : 'Complete',
                      style: TextStyle(color: const Color.fromARGB(255, 12, 144, 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  },
);

    },
  ),
)




  ],
),


            // Bottom App Bar with FABs
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_isExpanded)
  Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              // You can toggle left button shape independently if you want,
              // or toggle _isExpanded again if you want both together.
              // Here just toggling _isExpanded for demo:
              _isExpanded = false;
            });
          },
          
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = false;
            });
          },
          
        ),
      ],
    ),
  ),

                    
                  BottomAppBar(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.2 * 255).round()),
                            blurRadius: 20,
                            spreadRadius: 1,
                            offset: const Offset(0, -2),
                        ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         IconButton(
  icon: _selectedBottomIndex == 0
      ? ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.lightBlueAccent, Color.fromARGB(255, 3, 99, 177)],
          ).createShader(bounds),
          child: const Icon(Icons.home, color: Colors.white),
        )
      : const Icon(Icons.home, color: Colors.black),
  tooltip: 'Home',
  onPressed: () {
    setState(() {
      _selectedBottomIndex = 0;
    });
  },
),

_verticalDivider(),

IconButton(
  icon: _selectedBottomIndex == 2
      ? ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.lightBlueAccent, Color.fromARGB(255, 3, 99, 177)],
          ).createShader(bounds),
          child: const Icon(Icons.notifications, color: Colors.white),
        )
      : const Icon(Icons.notifications, color: Colors.black),
  tooltip: 'Notifications',
  onPressed: () {
    setState(() {
      _selectedBottomIndex = 2;
    });
  },
),

const SizedBox(width: 60), // Space for FAB


IconButton(
  icon: _selectedBottomIndex == 1
      ? ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.lightBlueAccent, Color.fromARGB(255, 3, 99, 177)],
          ).createShader(bounds),
          child: const Icon(Icons.settings, color: Colors.white),
        )
      : const Icon(Icons.settings, color: Colors.black),
  tooltip: 'Settings',
  onPressed: () {
    setState(() {
      _selectedBottomIndex = 1;
    });
  },
),
_verticalDivider(),

IconButton(
  icon: _selectedBottomIndex == 3
      ? ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.lightBlueAccent, Color.fromARGB(255, 3, 99, 177)],
          ).createShader(bounds),
          child: const Icon(Icons.person, color: Colors.white),
        )
      : const Icon(Icons.person, color: Colors.black),
  tooltip: 'Profile',
  onPressed: () {
    setState(() {
      _selectedBottomIndex = 3;
    });
  },
),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width / 2 - 30,
              child: AnimatedSwitcher(
  duration: const Duration(milliseconds: 300),
  transitionBuilder: (child, animation) =>
      ScaleTransition(scale: animation, child: child),
  child: GestureDetector(
    key: ValueKey<bool>(_isExpanded),
    
    child: Container(
      width: 56,
      height: 56,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.lightBlueAccent, Color.fromARGB(255, 3, 99, 177)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Center(
        child: Icon(
          _isExpanded ? Icons.event_busy : Icons.edit_calendar,
          color: Colors.black,
          size: 30,
        ),
      ),
    ),
  ),
),


            ),
          ],
        ),
        drawerEnableOpenDragGesture: false,
        drawer: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Drawer(
            width: MediaQuery.of(context).size.width * 0.50,
            backgroundColor: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 60,
                  child: Container(
                    color: Colors.grey[900],
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      'Menu',
                      style: GoogleFonts.baloo2(
                        textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Task Tracker',
              style: GoogleFonts.baloo2(
                textStyle: const TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.checkmark_alt, color: Colors.black, size: 30),
              tooltip: 'Star',
              onPressed: () {},
            ),
          ],
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black, size: 30),
              tooltip: 'Menu',
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'New Task',
              style: GoogleFonts.baloo2(
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          
          IconButton(
  icon: const Icon(Icons.add),
  color: Colors.black,
  tooltip: 'Add Tasks',
  onPressed: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TaskPage()),
    );
    // result is the created/updated task from TaskPage
    if (result != null) {
      setState(() {
        // Trigger rebuild to refresh task list with new data
      });
    }
  },
),

        ],
      ),
    );
  }
}
