import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'full_screen_image_widget.dart';

class GridImages extends StatelessWidget {
  final images;
  final gridCount;

  const GridImages({
    Key? key, this.images, this.gridCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCount,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: images!.length,
      itemBuilder: (BuildContext ctx, index) {
        return GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              border: Border.all(width: 0.2),
              image: DecorationImage(
                image: NetworkImage(images![index].urls.small),
                fit: BoxFit.cover,
              ),
            ),
          ),
          onTap: () {
            Get.to(() =>
                FullScreenImage(imageUrl: images![index].urls.regular),
            );
          },
        );
      },
    );
  }
}