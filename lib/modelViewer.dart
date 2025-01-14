import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class ModelViewer extends StatelessWidget {
  final String imagePath;

  ModelViewer(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Name der Karte")),
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.camera.zoom = 8; // Adjust zoom level if needed
            scene.camera.near = 2; // Adjust near clipping plane
            scene.world.add(Object(fileName: 'assets/models/1.obj'
                //'assets/models/${imagePath.split('/').last.replaceAll('.png', '.obj')}',
                ));
          },
        ),
      ),
    );
  }
}
