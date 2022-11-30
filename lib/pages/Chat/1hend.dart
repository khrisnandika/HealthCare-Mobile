import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final Map pengirim, penerima;
  const Chat({
    super.key,
    required this.pengirim,
    required this.penerima,
  });

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController chatController = TextEditingController();
  void sendMessage() async {
    // if(msg != "") {
    // Send Message
    // MessageModel newMessage = MessageModel(
    //   messageid: uuid.v1(),
    //   sender: widget.userModel.uid,
    //   createdon: DateTime.now(),
    //   text: msg,
    //   seen: false
    // );
    Map<String, dynamic> rooms = {
      "participant": [
        widget.penerima,
        widget.pengirim,
      ]
    };
    // var data = await FirebaseFirestore.instance.collection('rooms').add(rooms);
    // Map<String, dynamic> chat = {
    //   "idRoom": data.id,
    //   "user": widget.pengirim,
    //   "message": chatController.text,
    // };
    // await FirebaseFirestore.instance.collection('chat').add(chat);
    // print("object");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.penerima['nama'],
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          TextField(
            controller: chatController,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: "Pesan",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              sendMessage();
            },
            child: const Text(
              "Kirim",
            ),
          ),
        ],
      ),
    );
  }
}
