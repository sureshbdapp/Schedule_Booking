import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {"type": "received", "message": "Hey! How are you?", "time": "8:45 AM"},
    {
      "type": "sent",
      "message": "I am great and what about you?",
      "time": "8:46 AM"
    },
    {
      "type": "received",
      "message": "Fine. I need your help!",
      "time": "8:47 AM"
    },
    {
      "type": "sent",
      "message": "What's your problem? Do you need any legal support?",
      "time": "8:48 AM"
    },
    {
      "type": "received",
      "message": "Yes. I have a land problem",
      "time": "8:49 AM"
    },
    {
      "type": "sent",
      "message": "Okay, I will help you. Please explain what is the issue.",
      "time": "8:50 AM"
    },
    {
      "type": "received",
      "message": "I call you and told details",
      "time": "8:51 AM"
    },
    {"type": "sent", "message": "Okay. Thank You", "time": "8:52 AM"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/user2.png'), // Replace with your image asset
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Alex Smith", style: TextStyle(fontSize: 18)),
                Text("Online",
                    style: TextStyle(fontSize: 14, color: Colors.white70)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message['type'] == 'sent'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(10),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7),
                    decoration: BoxDecoration(
                      color: message['type'] == 'sent'
                          ? Colors.purple
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: message['type'] == 'sent'
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['message']!,
                          style: TextStyle(
                              color: message['type'] == 'sent'
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        SizedBox(height: 5),
                        Text(
                          message['time']!,
                          style: TextStyle(
                              color: message['type'] == 'sent'
                                  ? Colors.white70
                                  : Colors.black54,
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.purple),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.photo, color: Colors.purple),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type any text here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.purple),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
