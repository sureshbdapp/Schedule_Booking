import 'package:flutter/material.dart';
import 'package:schedule/utils/ClassWidgets.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MessagePage(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: etBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: SizedBox(
            height: 30,
            child: TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/profile.png'), // Replace with your image asset
          ),
          SizedBox(width: 10),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 8,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       IconButton(
      //         icon: Icon(Icons.message,
      //             color: _currentIndex == 0 ? Colors.purple : Colors.grey),
      //         onPressed: () {
      //           setState(() {
      //             _currentIndex = 0;
      //           });
      //         },
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.phone,
      //             color: _currentIndex == 1 ? Colors.purple : Colors.grey),
      //         onPressed: () {
      //           setState(() {
      //             _currentIndex = 1;
      //           });
      //         },
      //       ),
      //       SizedBox(width: 40), // Space for FAB
      //       IconButton(
      //         icon: Icon(Icons.notifications,
      //             color: _currentIndex == 2 ? Colors.purple : Colors.grey),
      //         onPressed: () {
      //           setState(() {
      //             _currentIndex = 2;
      //           });
      //         },
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.account_circle,
      //             color: _currentIndex == 3 ? Colors.purple : Colors.grey),
      //         onPressed: () {
      //           setState(() {
      //             _currentIndex = 3;
      //           });
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.purple,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class MessagePage extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {
      "name": "Brandy Prescott",
      "time": "3 min",
      "message": "Hi Mike. How are you?",
      "image": "assets/images/user1.png"
    },
    {
      "name": "Alex Smith",
      "time": "45 min",
      "message": "Please let me know your problem",
      "image": "assets/images/user2.png"
    },
    {
      "name": "Danna Harvey",
      "time": "45 min",
      "message": "Thanks for contact me. I need your help...",
      "image": "assets/images/user3.png"
    },
    {
      "name": "Lester Phillips",
      "time": "Yesterday",
      "message": "Image",
      "image": "assets/images/user4.png"
    },
    {
      "name": "Quiche Hollandaise",
      "time": "Monday",
      "message": "I am great and what about you?",
      "image": "assets/images/user5.png"
    },
    {
      "name": "Marvin White",
      "time": "Tuesday",
      "message": "Yes, I will help you. Please explain what's the issue.",
      "image": "assets/images/user6.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage:
                AssetImage(message['image']!), // Replace with your image asset
          ),
          title: Text(message['name']!),
          subtitle: Text(message['message']!),
          trailing: Text(message['time']!),
        );
      },
    );
  }
}
