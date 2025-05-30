import 'dart:convert';
import 'package:chat_app_eve/models/image_model.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app_eve/widgets/chat-bubble.dart';
import 'package:chat_app_eve/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'models/chat_message_entity.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //initiate state of messages
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    rootBundle.loadString('assets/mock_messages.json').then((response) {
      final List<dynamic> decodeList = jsonDecode(response) as List;

      final List<ChatMessageEntity> _chatMessages = decodeList.map((listItem) {
        return ChatMessageEntity.fromJson(listItem);
      }).toList();

      print(_chatMessages.length);
      //final state of messages
      setState(() {
        _messages = _chatMessages;
      });
    }).then((_) {
      print('Done!');
    });

    //print('Something');
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

//TODO: Get Network Images from API
  Future<List<PixelfordImage>> _getNetworkImages() async {
    var endpointUrl = Uri.parse(
        'https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-bichon-frise-dog-royalty-free-image-1682312789.jpg?crop=0.668xw:1.00xh;0.126xw,0&resize=980:*');

    final response = await http.get(endpointUrl);

    if (response.statusCode == 200) {
      final List<dynamic> decodeList = jsonDecode(response.body) as List;

      final List<PixelfordImage> _imageList = decodeList.map((listItem) {
        return PixelfordImage.fromJson(listItem);
      }).toList();
      print(_imageList[0].urlFullSize);
      return _imageList;
    } else {
      throw Exception('API not successful!');
    }
  }

  @override
  void initState() {
    _loadInitialMessages();
    _getNetworkImages();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getNetworkImages();
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
              onPressed: () {
                //TODO: Navigate back to LoginPage on logout
                Navigator.pushReplacementNamed(context, '/');
                print('Icon Pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          FutureBuilder<List<PixelfordImage>>(
              future: _getNetworkImages(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PixelfordImage>> snapshot) {
                if (snapshot.hasData)
                  return Image.network(snapshot.data![0].urlFullSize);
                return CircularProgressIndicator();
              }),
          Expanded(
            flex: 1,
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                      alignment: _messages[index].author.userName == 'poojab26'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      entity: _messages[index]);
                }),
          ),
          ChatInput(
            onSubmit: onMessageSent,
          ),
        ],
      ),
    );
  }
}
