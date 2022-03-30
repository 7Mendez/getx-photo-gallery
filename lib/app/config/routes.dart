import 'package:get/get.dart';

import '../modules/photo_gallery/photo_gallery_binding.dart';
import '../modules/photo_gallery/photo_gallery_layout.dart';

List<GetPage> routes = [
    GetPage(
        name: '/photo-gallery',
        page: () => const PhotoGalleryLayout(), binding: PhotoGalleryBinding()
    ),
];