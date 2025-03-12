import 'package:get/get.dart';

enum BottomNavState { home, add, profile }

class BottomNavController extends GetxController {
  var selectedItem = BottomNavState.home.obs;

  void selectItem(BottomNavState item) {
    selectedItem.value = item;
  }
}
