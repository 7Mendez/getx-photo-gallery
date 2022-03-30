import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: const Text("Cargando...", style: TextStyle(fontSize: 25)),
            margin: const EdgeInsets.all(20),
          ),
          const SizedBox(height: 70.0),
          const SizedBox(
            width: 200,
            height: 200,
            child: CircularProgressIndicator(strokeWidth: 8),
          ),
        ],
      ),
    );
  }
}
