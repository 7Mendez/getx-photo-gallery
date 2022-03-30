import 'package:flutter/material.dart';
import '../../common/responsive.dart';
import 'photo_gallery_view.dart';

class PhotoGalleryLayout extends StatelessWidget {
  const PhotoGalleryLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Responsive(
          mobile: PhotoGallery(
            galleryPadding: 30.0,
            boxHeight: 20,
            fontSize: 30,
            gridCount: 2,
            gridPadding: 10.0,
          ),
          tablet: PhotoGallery(
            galleryPadding: 40.0,
            boxHeight: 25,
            fontSize: 35,
            gridCount: 3,
            gridPadding: 10.0,
          ),
          desktop: PhotoGallery(
            galleryPadding: 20.0,
            boxHeight: 30,
            fontSize: 40,
            gridCount: 4,
            gridPadding: 10.0,
          ),
        ),
      ),
    );
  }
}
