import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chatProvider.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    // Fetch messages when the chat screen is opened
    chatProvider.fetchMessages();

    return Scaffold(
      appBar: AppBar(title: Text('CEO Messages')),
      body: Consumer<ChatProvider>(
        builder: (context, chatProvider, child) {
          if (chatProvider.messages.isEmpty) {
            return Center(child: Text('No messages found.'));
          } else {
            return ListView.builder(
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(chatProvider.messages[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
