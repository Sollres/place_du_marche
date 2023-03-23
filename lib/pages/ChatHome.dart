import 'package:flutter/material.dart';
import 'ChatScreen.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
  final int? id = 15;

}

class _ContactListState extends State<ContactList> {
  List<String> _contacts = ['Alice', 'Bob', 'Charlie'];
  List<String> _messages = ['Salut', 'Comment ça va ?', 'On se voit ce soir ?'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des contacts et messages'),
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_contacts[index]),
            subtitle: Text(_messages[index]),
            onTap: () {
              ChatScreen(userid: widget.id, recid: 17);
            },
          );
        },
      ),
    );
  }
}