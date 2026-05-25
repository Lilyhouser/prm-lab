import 'package:flutter/material.dart';

class CoreWidget extends StatelessWidget {
  const CoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Welcome to Flutter UI",
            style: TextStyle(fontSize: 30, color: Colors.black),),
          Icon(Icons.file_open, color: Colors.lightBlueAccent),
          Image.network(
            "https://imgv3.fotor.com/images/videoImage/wonderland-girl-generated-by-Fotor-ai-art-generator.jpg",
          ),
        ],
      ),
    );
  }
}
