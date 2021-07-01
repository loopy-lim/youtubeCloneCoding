import 'youtubeContext.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var context = <YoutubeContext>[].obs;
  addContext(
      String title, String content, String img, int viewcount, int time) {
    context.add(YoutubeContext(title, content, img, viewcount, time));
  }

  removeContext(int index) {
    context.removeAt(index);
  }
}
