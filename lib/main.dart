import 'package:chat_app_eve/chat_page.dart';
import 'package:chat_app_eve/login_page.dart';
import 'package:chat_app_eve/counter_stateful_demo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: CounterStateful(buttonColor: Colors.blue),
    );
  }
}
