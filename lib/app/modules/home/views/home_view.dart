import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes_app/app/data/models/notes.dart';
import 'package:notes_app/app/data/models/themes.dart';
import 'package:notes_app/app/modules/addNote/controllers/add_note_controller.dart';
import 'package:notes_app/app/modules/addNote/views/add_note_view.dart';
import 'package:notes_app/app/modules/editNote/controllers/edit_note_controller.dart';
import 'package:notes_app/app/modules/editNote/views/edit_note_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final EditNoteController editNoteController = Get.put(EditNoteController());
  final AddNoteController addNoteController = Get.put(AddNoteController());
  final HomeController homeController = Get.put(HomeController());
  final Themes themes = Themes();
  final GetStorage storage = GetStorage();

  HomeView({Key ?key}) : super(key: key) {
    // Load saved notes when HomeView is initialized
   void saveNotes() {
  List<Map<String, dynamic>> notesToSave = homeController.addNoteController.notes.map((note) => note.toMap()).toList();
  storage.write('notes', notesToSave);
}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          Switch(
            value: themes.isSavedDarkMode(),
            onChanged: (value) {
              themes.changeTheme();
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: addNoteController.notes.length,
                  itemBuilder: (context, index) {
                    final note = addNoteController.notes[index];
                    final color = index % 2 == 0
                        ? Color.fromARGB(255, 214, 151, 15)
                        : Color.fromARGB(255, 248, 207, 141); // Alternate colors for ListTiles
                    return Container(
                      color: color,
                      child: GestureDetector(
                        onTap: () {
                   Get.to(()=>EditNoteView(note),arguments: note);},
                        child: ListTile(
                          title: Text(note.title),
                          subtitle: Text(note.description),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              editNoteController.deleteNote(index);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    
                    Get.to(() => AddNoteView());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 212, 95, 233),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
