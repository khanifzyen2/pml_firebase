import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final List<Widget> myChats = List.generate(
    20,
    (index) => ListTile(
      onTap: () {},
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black26,
        child: Image.asset(
          "assets/logo/noimage.png",
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        "Orang ke ${index + 1}",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        "Status orang ke ${index + 1}",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      trailing: Chip(
        label: Text("3"),
      ),
    ),
  ).reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Material(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38),
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chats",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red[900],
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(50),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: myChats.length,
                itemBuilder: (context, index) => myChats[index]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message_rounded),
        onPressed: () {},
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
