import 'package:chat_app_eve/widgets/chat-bubble.dart';
import 'package:chat_app_eve/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Hi Andrei!'),
        actions: [
          IconButton(
              onPressed: () {
                print('Icon Pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                ChatBubble(
                    alignment: Alignment.centerLeft,
                    message: 'Hello, this is Andrei'),
                ChatBubble(alignment: Alignment.centerRight, message: 'Hi!!')
              ],
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
