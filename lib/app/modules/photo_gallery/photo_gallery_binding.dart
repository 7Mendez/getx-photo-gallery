import 'package:get/get.dart';
import 'photo_gallery_controller.dart';

class PhotoGalleryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotoGalleryController());
  }
}