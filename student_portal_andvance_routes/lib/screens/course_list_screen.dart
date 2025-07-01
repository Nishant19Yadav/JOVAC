import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../models/course_model.dart';

class CourseListScreen extends StatelessWidget {
  final List<Course> courses = [
    Course(title: 'Flutter Basics', description: 'Introduction to Flutter.'),
    Course(title: 'Dart Language', description: 'Learn Dart in depth.'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        title: Text('Courses'),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.courseDetail,
              arguments: course,
            ),
            child: Card(
              margin: EdgeInsets.only(bottom: 16),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    // Icon or illustration
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.brown.shade100,
                      child: Icon(Icons.book_outlined, size: 30, color: Colors.brown),
                    ),
                    SizedBox(width: 20),
                    // Text Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.title,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6),
                          Text(
                            course.description,
                            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.brown),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}