import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Map<String, dynamic> task;
  final Function() onDelete;
  final VoidCallback onTap;// void function which will work later when we will do ontap like when we use in gesturedetector
  final List<Color> taskColors;
  const TaskCard({super.key, required this.task, required this.onDelete, required this.onTap, required this.taskColors});

  @override
  Widget build(BuildContext context) {
    final colorIndex = task['color'] as int;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: taskColors[colorIndex],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child:  Text(
                    task['date'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),),
                  Text(
                    task['title'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                      task['description'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,)
                  ),
                ],
              ),
            ),

            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                // icon button like for showcase for edit so that user can identify that what to do..
                Icon(Icons.edit_note, color: Colors.grey[100], size: 40,),
                // this icon button basically used to delete the task from database which are showing in screen
                IconButton(

                    onPressed:(){
                  onDelete();
                },
                    icon:
                    Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 30,
                    )
                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}
