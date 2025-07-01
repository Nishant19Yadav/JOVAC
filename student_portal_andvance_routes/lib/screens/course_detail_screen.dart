import 'package:flutter/material.dart';
import '../models/course_model.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  CourseDetailScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        title: Text(course.title),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Illustration
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://ouch-cdn2.icons8.com/sfAjIBo5U_3UO-8pNi2G7CVAZMSQ_-y_o0DzDLEBrqE/rs:fit:368:274/czM6Ly9pY29uczgvZXNzZW50aWFscy1jb21wYW55L2xlYXJuaW5nX3BsYXRmb3JtXzIucG5n.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade800,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Course Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    course.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                  SizedBox(height: 30),

                  // Start Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Starting ${course.title}...')),
                        );
                      },
                      icon: Icon(Icons.play_circle_fill),
                      label: Text('Start Course'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.shade700,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        textStyle: TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}