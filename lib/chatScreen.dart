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
            return Center(child: Text('Noch ist es leer hier...'));
          } else {
            return ListView.builder(
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  message: chatProvider.messages[index],
                  onLongPress: () {
                    showEmojiPicker(context, chatProvider.messages[index]);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  void showEmojiPicker(BuildContext context, String message) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EmojiPicker(message: message);
      },
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final VoidCallback onLongPress;

  ChatBubble({required this.message, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            left: 15,
            top: 0,
            child: CustomPaint(
              painter: ChatBubbleTail(),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubbleTail extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(10, 10);
    path.lineTo(0, 20);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class EmojiPicker extends StatelessWidget {
  final String message;

  EmojiPicker({required this.message});

  @override
  Widget build(BuildContext context) {
    final List<String> emojis = ['👍', '❤️', '😂', '😮', '😢', '👏'];

    return Wrap(
      children: emojis.map((emoji) {
        return InkWell(
          onTap: () {
            // Handle emoji selection here
            Navigator.pop(context);
            print('Selected emoji $emoji for message: $message');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              emoji,
              style: TextStyle(fontSize: 30),
            ),
          ),
        );
      }).toList(),
    );
  }
}
