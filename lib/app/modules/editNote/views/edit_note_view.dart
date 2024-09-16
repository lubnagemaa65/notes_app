import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/app/data/models/themes.dart';
import 'package:notes_app/app/modules/editNote/controllers/edit_note_controller.dart';

import '../../../data/models/notes.dart';

class EditNoteView extends GetView<EditNoteController> {
  final EditNoteController editNoteController = Get.put(EditNoteController());
  final Themes themes = Themes();
    final Notes note;


  EditNoteView(this.note, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            value: themes.isSavedDarkMode(),
            onChanged: (value) {
              themes.changeTheme();
            },
          ),
        ],
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Edit Note',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1ab8db),
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset(
              'assets/4025692.jpg', // Ensure this asset exists.
              width: 200,
              height: 200,
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: editNoteController.titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter note title',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: editNoteController.descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter note description',
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                     final updatedNote = Notes(
                      title: editNoteController.titleController.text,
                      description: editNoteController.descriptionController.text,
                    );
              Get.find<EditNoteController>().updatedNote(note as int, updatedNote);
                    Get.back();
                  },
                  child: Text('update'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1ab8db),
                    shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: Size(106, 40),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                  editNoteController.deleteNote(note as int);
                  Get.back(); // Go back to the previous screen
                  },
                  child: Text('delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: Size(106, 40),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
