import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/pages/Chat/chat.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  List<Map> users = [
    {
      "id": 1,
      "nama": "Indra",
      "email": "indra@gmail.com",
      "jk": "L",
      "alamat": "BWS",
    },
    {
      "id": 2,
      "nama": "Krisna",
      "email": "krisna@gmail.com",
      "jk": "L",
      "alamat": "BWS",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text("chat"),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: users.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chat(
                        pengirim: users[0],
                        penerima: users[1],
                      ),
                    ),
                  );
                },
                child: Text(
                  users[index]['nama'],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
