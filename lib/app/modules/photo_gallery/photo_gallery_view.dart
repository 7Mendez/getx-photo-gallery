import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'photo_gallery_controller.dart';
import 'widgets/grid_images_widget.dart';
import '../../common/widgets/loading_widget.dart';
import 'widgets/search_image_widget.dart';

class PhotoGallery extends GetView<PhotoGalleryController> {
  final double gridPadding;
  final double galleryPadding;
  final double boxHeight;
  final double fontSize;
  final int gridCount;

  const PhotoGallery({
    Key? key,
    required this.gridPadding,
    required this.boxHeight,
    required this.fontSize,
    required this.gridCount,
    required this.galleryPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(galleryPadding),
        child: mainWidgetsList(),
      ),
    );
  }

  Column mainWidgetsList() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: boxHeight),
          Text('Photo Gallery', style: TextStyle(fontSize: fontSize)),
          SizedBox(height: boxHeight),
          SearchImage(controller: controller),
          SizedBox(height: boxHeight),
          buildGridView(gridCount),
          SizedBox(height: boxHeight),
          buildVisibility(),
        ]);
  }

  Widget buildGridView(gridCount) {
    return GetBuilder<PhotoGalleryController>(
        builder: (_) => Expanded(
            child: _.loading == true
                ? const LoadingWidget()
                : _.images!.isNotEmpty
                    ? GridImages(images: _.images, gridCount: gridCount)
                    : Center(
                        child: Text(_.message,
                            style: const TextStyle(fontSize: 20),))));
  }

  Obx buildVisibility() {
    return Obx(
      () => Visibility(
        visible: controller.lastPage > 0,
        child: Center(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
                child: const Text('Cargar Más'),
                onPressed: () => {
                      controller.loadMore(),
                    }),
          ),
        ),
      ),
    );
  }
}

