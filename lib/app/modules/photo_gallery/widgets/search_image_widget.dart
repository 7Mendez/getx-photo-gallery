import 'package:flutter/material.dart';

import '../photo_gallery_controller.dart';

class SearchImage extends StatelessWidget {
  const SearchImage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PhotoGalleryController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.searchFormKey,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                controller: controller.searchController,
                decoration: const InputDecoration(
                    labelText: 'Buscar', border: OutlineInputBorder()),
                textInputAction: TextInputAction.go,
                onFieldSubmitted: (value) {
                  controller.search();
                  controller.searchController.clear();
                }),
          ),
          const SizedBox(width: 10.0),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                child: const Text('Buscar Imagen con unSplash API'),
                onPressed: () => {
                  controller.search(),
                  controller.searchController.clear()
                }),
          )
        ],
      ),
    );
  }
}
