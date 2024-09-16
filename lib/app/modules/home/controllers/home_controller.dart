import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes_app/app/data/models/notes.dart';

import '../../addNote/controllers/add_note_controller.dart';

class HomeController extends GetxController {
  RxList<Notes> notes = <Notes>[].obs;
    final GetStorage storage = GetStorage();
      final HomeController homeController = Get.put(HomeController());
  final AddNoteController addNoteController = Get.put(AddNoteController());


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
     // Save the notes to GetStorage when HomeView is closed
    List<Map<String, dynamic>> notesData = homeController
        .addNoteController.notes
        .map((note) => note.toMap())
        .toList();
    storage.write('notes', notesData);
    super.onClose();
  }
void deleteNote(int index) {
      if (index >= 0 && index < notes.length) {
        notes.removeAt(index);
      }
  }
   
 
}

