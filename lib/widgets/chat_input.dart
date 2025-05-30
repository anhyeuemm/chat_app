import 'package:flutter/material.dart';
import 'package:chat_app_eve/models/chat_message_entity.dart';
import 'package:chat_app_eve/widgets/picker_body.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print('Chat message: ${chatMessageController.text}');
    //TODO: Add this new message to the default list
    final newChatMessage = ChatMessageEntity(
        text: chatMessageController.text,
        id: "244",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(userName: 'poojab26'));

    onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              //TODO: Open a bottom sheet that shows a grid of images
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return NetworkImagePickerBody();
                  });
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          //TODO: Add multi-line Textfield here
          Expanded(
              child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            controller: chatMessageController,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: "Type your message",
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none),
          )),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    );
  }
}
