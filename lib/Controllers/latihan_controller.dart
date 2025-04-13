import 'package:get/get.dart';

class LatihanController extends GetxController {
  var selectedIndex = RxnInt(); // nullable, belum pilih = null

  void pilihJawaban(int index) {
    selectedIndex.value = index;
  }
}
