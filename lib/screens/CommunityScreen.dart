import 'package:flutter/material.dart';

import '../utils/ClassWidgets.dart';

class CommunityPage extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {
      "name": "Jerome",
      "time": "41m ago",
      "content":
          "Man, you’re my new guru! Viewing the lessons for a second time. Thoroughly pleased. And impressed that you draw from scientific literature in telling memorable...",
      "likes": "5k",
      "comments": "20"
    },
    {
      "name": "Gretchen",
      "time": "41m ago",
      "content":
          "I loved the course! I’ve been trying to break all this great stuff down into manageable chunks to help my clients develop healthy habits and achieve their personal...",
      "likes": "3k",
      "comments": "15"
    },
    {
      "name": "Al",
      "time": "41m ago",
      "content":
          "This course contains the most complete material on habit formation that I’ve seen. There is just enough theory to explain the principles, and not so much...",
      "likes": "2k",
      "comments": "10"
    },
    {
      "name": "Colin",
      "time": "41m ago",
      "content":
          "James Clear’s Habit’s Academy course has tremendously changed my life for the better! Having been a self-improvement aficionado for decades...",
      "likes": "4k",
      "comments": "22"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: etBackground,
      appBar: appBar(context, "Community", false, false, true),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return CommunityPost(
            name: post['name']!,
            time: post['time']!,
            content: post['content']!,
            likes: post['likes']!,
            comments: post['comments']!,
          );
        },
      ),
    );
  }
}

class CommunityPost extends StatelessWidget {
  final String name;
  final String time;
  final String content;
  final String likes;
  final String comments;

  CommunityPost({
    required this.name,
    required this.time,
    required this.content,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                      'assets/images/user_icon.png'), // Add your image asset
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(time),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.share,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Divider(
            color: etBackground,
          ),
          SizedBox(height: 5),
          Text(content),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(Icons.thumb_up, color: Colors.orange),
                  SizedBox(width: 3),
                  Text(likes),
                ],
              ),
              SizedBox(
                width: 7,
              ),
              Row(
                children: [
                  Icon(Icons.comment, color: Colors.orange),
                  SizedBox(width: 3),
                  Text(comments),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
