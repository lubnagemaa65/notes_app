import 'package:get/get.dart';
import 'package:notes_app/app/modules/editNote/controllers/edit_note_controller.dart';

class EditNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => EditNoteController());
  }
}
