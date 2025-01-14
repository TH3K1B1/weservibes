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
                return ChatBubble(
                  message: chatProvider.messages[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;

  ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
