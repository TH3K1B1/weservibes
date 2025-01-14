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
            scene.camera.near = 4; // Adjust near clipping plane
            final model = Object(fileName: 'assets/models/1.obj');
            scene.world.add(model);
          },
        ),
      ),
    );
  }
}
