import 'package:get/get.dart';
import 'package:notes_app/app/modules/home/views/home_view.dart';

class SplashController extends GetxController {

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
    super.onClose();
  }
    void navigateToHome() async {
    await Future.delayed(Duration(seconds: 3)); // Wait for 3 seconds
    Get.off(()=>HomeView());
    // Navigate to HomeScreen
  }

}
