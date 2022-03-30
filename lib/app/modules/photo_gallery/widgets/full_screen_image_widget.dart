import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  const FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.contain),
        ),
      ),
    );
  }
}