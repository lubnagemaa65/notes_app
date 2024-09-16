import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes_app/app/data/models/themes.dart';
import 'package:notes_app/app/modules/addNote/controllers/add_note_controller.dart';
import 'package:notes_app/app/modules/home/controllers/home_controller.dart';
import 'package:notes_app/app/modules/home/views/home_view.dart';

import '../../../data/models/notes.dart';

class AddNoteView extends GetView<AddNoteController> {
  final AddNoteController addNoteController = Get.put(AddNoteController());
  final Themes themes = Themes();
    final HomeController homeController = Get.put(HomeController());
  final GetStorage storage = GetStorage();


  AddNoteView({Key? key}) : super(key: key);
void saveNotes() {
      List<Map<String, dynamic>> notesToSave = homeController
          .addNoteController.notes
          .map((note) => note.toMap())
          .toList();
      storage.write('notes', notesToSave);
    }
  

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
          'Add Note',
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
              'assets/logo.jpg', // Ensure this asset exists.
              width: 300,
              height: 300,
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: addNoteController.titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter note title',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: addNoteController.descriptionController,
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
           // Save the task details
                    addNoteController.addNote(
                      addNoteController.titleController.text,
                      addNoteController.descriptionController.text,


                      
                     );
                     saveNotes();
                     
                    Get.offAll(() => HomeView());  
  
                  },
                  child: Text('Add'),
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
                    Get.back(); // Go back to the previous screen
                  },
                  child: Text('Cancel'),
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
