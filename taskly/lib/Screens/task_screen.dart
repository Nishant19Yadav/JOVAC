import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskly/Screens/task_card.dart';
import 'package:taskly/Widgets/task_dialog.dart';

import '../Database/taskly_database.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Map<String, dynamic>> tasks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTasks();
  }

  final List<Color> taskColors = [
    Color(0xFF1ABC9C),
    Color(0xFF2ECC71),
    Color(0xFF3498DB),
    Color(0xFF9B59B6),
    Color(0xFF34495E),
    Color(0xFFF1C40F),
    Color(0xFFE67E22),
    Color(0xFFE74C3C),
    Color(0xFF95A5A6),
    Color(0xFF7F8C8D),
  ];
  Future<void> fetchTasks() async {
    final fetchTasks = await TasklyDatabase.instance.getTasks();
    setState(() {
      tasks = fetchTasks;
    });
  }
  // this method basically used to open alert dialog when we click on add button or tap  on edit or card
  void showTaskDialog({
    int? id,
    String? title,
    String? description,
    int colorIndex = 0,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return TaskDialog(
          colorIndex: colorIndex,
          taskColors: taskColors,
          taskid: id,
          title: title,
          description: description,
          onTaskSave: (newTitle, newDescription, newColorIndex, newDate) async {
            //if id is null means it is going to add the task in database
            if (id == null) {
              await TasklyDatabase.instance.addTaskly(
                newTitle,
                newDescription,
                newDate,
                newColorIndex,
              );
              // means id does not null that means we want to update the task in database
            } else {
              await TasklyDatabase.instance.updateTask(
                newTitle,
                newDescription,
                newDate,
                newColorIndex,
                id,
              );
            }
            // after update or add we want to see all the task we have saved in database or update in database
            fetchTasks();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xEBE2E2FF),
        elevation: 1,
        title: Text(
          'Taskly',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 6),
            child: SizedBox(
              height: 400,
              width: 100,
              child: Lottie.asset(
                'assets/lotties/tasklyanimation.json',
                repeat: true,
              ),
            ),
          ),
        ],
      ),
      body: tasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.note_alt, size: 100, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'No Tasks Found',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskCard(
                    task: task,
                    onDelete: () async {
                      // inside the taskcard we defined the function to delete the task
                      await TasklyDatabase.instance.deleteTask(task['id']);
                      fetchTasks();
                    },
                    onTap: () {
                      // this is used to open the dialog when we click on the task to edit okay
                      showTaskDialog(
                        id: task['id'],
                        title: task['title'],
                        description: task['description'],
                        colorIndex: task['color'],
                      );
                    },
                    taskColors: taskColors,
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showTaskDialog();
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
