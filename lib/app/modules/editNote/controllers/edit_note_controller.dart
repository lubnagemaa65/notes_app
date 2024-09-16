import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/notes.dart';

class EditNoteController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  RxList<Notes> notes = <Notes>[].obs;
  final GetStorage storage = GetStorage();

  // Method to toggle the completion status of a note
  void toggleNoteCompletion(int index) {
    if (index >= 0 && index < notes.length) {
      final note = notes[index];
      note.completed = !note.completed;
      notes[index] = note;
      update();
    }
  }

  // Method to update a specific note
 

  // Method to delete a note
  void deleteNote(int index) {
    if (index >= 0 && index < notes.length) {
      notes.removeAt(index);
      update();
    }
  }
  void updatedNote(int index, Notes updatedNote) {
    notes[index] = updatedNote;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    //  List<dynamic>? savedNotes = storage.read('notes');

    // if (savedNotes != null) {
    //   notes.assignAll(
    //       savedNotes.map((noteData) => Notes.fromMap(noteData)).toList());
    // }
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
