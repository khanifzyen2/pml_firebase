import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        leadingWidth: 100,
        leading: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 5),
              Icon(Icons.arrow_back),
              SizedBox(width: 5),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                child: Image.asset("assets/logo/noimage.png"),
              ),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lorem Ipsum",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "statusnya lorem",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  ItemChat(isSender: true),
                  ItemChat(isSender: false),
                  ItemChat(isSender: false),
                  ItemChat(isSender: false),
                  ItemChat(isSender: true),
                  ItemChat(isSender: false),
                  ItemChat(isSender: true),
                  ItemChat(isSender: false),
                  ItemChat(isSender: true),
                  ItemChat(isSender: false),
                ],
              ),
              color: Colors.green,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: Get.width,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //TextField(),
                Expanded(
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.emoji_emotions_outlined),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red[900],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.isSender,
  }) : super(key: key);

  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      color: Colors.amber,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: isSender
                  ? BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
            ),
            padding: EdgeInsets.all(15),
            child: Text(
              "Ini adalah cat pertama",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 5),
          Text("18:22 AM"),
        ],
      ),
    );
  }
}
