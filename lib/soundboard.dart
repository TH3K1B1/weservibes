import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Soundboard extends StatelessWidget {
  final List<Map<String, String>> sounds = [
    {'name': 'Sound 1', 'path': 'sounds/sound1.mp3'},
    // Add more sound files here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Soundboard')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Adjust the number of columns as needed
        ),
        itemCount: sounds.length,
        itemBuilder: (context, index) {
          var sound = sounds[index];
          return SoundButton(
            name: sound['name']!,
            path: sound['path']!,
          );
        },
      ),
    );
  }
}

class SoundButton extends StatelessWidget {
  final String name;
  final String path;
  final AudioPlayer _audioPlayer = AudioPlayer();

  SoundButton({required this.name, required this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _audioPlayer.play(AssetSource(path));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
