import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatProvider with ChangeNotifier {
  List<String> _messages = [];

  List<String> get messages => _messages;

  ChatProvider() {
    fetchMessages(); // Optional: Fetch messages at initialization
  }

  void fetchMessages() async {
    FirebaseFirestore.instance
        .collection('chats')
        .snapshots()
        .listen((snapshot) {
      _messages = snapshot.docs.map((doc) => doc['message'] as String).toList();

      // Print the entire database
      snapshot.docs.forEach((doc) {
        print('Document ID: ${doc.id}, Data: ${doc.data()}');
      });

      notifyListeners();
    });
  }
}
