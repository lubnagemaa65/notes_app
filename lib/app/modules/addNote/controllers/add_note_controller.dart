import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes_app/app/data/models/notes.dart';

class AddNoteController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxList<Notes> notes = <Notes>[].obs;
  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    titleController.text = '';
    descriptionController.text = '';
  }

  // Method to add a new note
  void addNote(String title, String description) {
    notes.add(Notes(title: title, description: description));
    saveNotes();
  }
  //  void addNote(Notes newNote) {
  //   notes.add(newNote);
  //   saveNotes();
  // }

  // Method to toggle the completion status of a note
  void toggleNoteCompletion(int index) {
    if (index >= 0 && index < notes.length) {
      final note = notes[index];
      note.completed = !note.completed;
      notes[index] = note;
      saveNotes();
    }
  }



  // Method to save notes to GetStorage
  void saveNotes() {
    List<Map<String, dynamic>> notesData =
        notes.map((note) => note.toMap()).toList();
    storage.write('notes', notesData);
  }
}
