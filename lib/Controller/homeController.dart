import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class homeController extends GetxController {
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }
  ontap(int index)
  {
    currentIndex(index);
  }
}