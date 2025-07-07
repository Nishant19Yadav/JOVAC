import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// this is the task dialog or alert dialog to open when we click on add button inside the show dialog
class TaskDialog extends StatefulWidget {
  final int? taskid;
  final String? title;
  final String? description;
  final int colorIndex;
  final List<Color> taskColors;
  // this is the method which is used to save the task in database
  final Function onTaskSave;

  const TaskDialog({
    super.key,
    this.taskid,
    this.title,
    this.description,
    required this.colorIndex,
    required this.taskColors,
    required this.onTaskSave,
  });

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  late int _selectedColorIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedColorIndex = widget.colorIndex;
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateFormat('E d MMM').format(DateTime.now());
    final titleController = TextEditingController(text: widget.title);
    final descriptionController = TextEditingController(
      text: widget.description,
    );
    return AlertDialog(
      backgroundColor: widget.taskColors[_selectedColorIndex],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        widget.taskid == null ? 'Add Task' : 'Edit Task',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // this is used to show the content in ui with responsive
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentDate,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 16),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Title',
                labelStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Description',
                alignLabelWithHint: true,
                labelStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: List.generate(
                widget.taskColors.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColorIndex = index;
                    });
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: widget.taskColors[index],
                    child: _selectedColorIndex == index
                        ? Icon(Icons.check, color: Colors.white, size: 16)
                        : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel', style: TextStyle(color: Colors.black54)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          //this is on pressed method which will be called when we click on save button
          onPressed: () async{
            final newTitle = titleController.text;
            final newDescription = descriptionController.text;
            // this is the method which is used to save the task in database
            widget.onTaskSave(
              newTitle,
              newDescription,
              _selectedColorIndex,
              currentDate
            );
            // to close the dialog after saving the task
            Navigator.pop(context);
          },
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
