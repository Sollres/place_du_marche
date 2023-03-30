import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'ChatScreen.dart';

class MessagesList extends StatefulWidget {
  const MessagesList({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final int? userId;

  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  List<dynamic> _messages = [];

  Future<List<dynamic>> getData(int? userId) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:80/getmessages.php'),
      body: {
        'user': widget.userId.toString(),
      },
    );
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getData(widget.userId),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(list: snapshot.data!, messagesList: this)
              : Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List<dynamic> list;
  final _MessagesListState messagesList;

  ItemList({required this.list, required this.messagesList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(list[i]['Nom']),
          //subtitle: Text(list[i]['iduser']),
          leading: Icon(Icons.message),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  userid: messagesList.widget.userId,
                  recid: int.parse(list[i]['iduser']),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
