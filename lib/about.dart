import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Weservibes App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Das ist die Weservibes App. Du kannst dir hier deine Eintrittskarten als Sammelkarten einscannen. '
              'Die Karten können ausgewählt und in einer 3D Ansicht angezeigt werden. '
              'Auf der Rückseite jeder Karte ist ein QR Code eingraviert. Verwende diesen am Einlass.'
              'Durch die App wird es auch kleine Boni und Goodies geben. Informationen Folgen.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Version: 1.0.0',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
