import 'package:get/get.dart';

class Controller extends GetxController {
  int counter = 100;


  incrementCount() {
    counter ++ ;
    update();
  }

  decrementCount() {
    counter -- ;
    update();
  }

}