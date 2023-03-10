import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  final _userController = TextEditingController();
  final _recipientController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  Future<void> _getMessages() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:80/chat.php'));

    print("++++++++++++++++++response _getMessages()  ++++++++++++++++");
    print(response.body);
    final List<dynamic> responseData = json.decode(response.body);
    print("++++++++++++++++++responseDATA _getMessages()  ++++++++++++++++");
    print(responseData);

    setState(() {
      _messages.clear();
      _messages.addAll(responseData.map((message) => Map<String, dynamic>.from(message)));
    });
  }

  Future<void> _sendMessage() async {
    final user = _userController.text;
    final message = _messageController.text;
    final recipient = _recipientController.text;
    final response = await http.post(
      Uri.parse('http://10.0.2.2:80/chat.php'),
      body: {
        'user': user,
        'message': message,
        'recipient': recipient,
      },
    );

    print("++++++++++++++++++response _SendMessages()  ++++++++++++++++");
    print(response.body);

    _getMessages();
    print("++++++++++++++++++response getMessages()  ++++++++++++++++");
    print(_getMessages());
    _messageController.clear();
  }

  Widget _buildMessageBubble(Map<String, dynamic> message, bool isMe) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: isMe ? Radius.circular(0) : Radius.circular(12),
              bottomRight: isMe ? Radius.circular(12) : Radius.circular(0),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                message['message'],
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                message['user'],
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message['user'] == 'Me';
                return _buildMessageBubble(message, isMe);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _recipientController,
                    decoration: InputDecoration(
                      hintText: 'Recipient',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
