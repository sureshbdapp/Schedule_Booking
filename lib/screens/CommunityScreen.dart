import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schedule/api/ApiBaseService.dart';
import 'package:schedule/models/ApiResponse.dart';
import 'package:schedule/models/ResponseDashboard.dart';
import '../utils/ClassWidgets.dart';
import 'package:schedule/api/ApiBaseService.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  void initState() {
    super.initState();
    dashboardApi();
  }

  late final List<ResponseDashboard> apiList = [];
  Future<void> dashboardApi() async {
    ApiBaseService()
        .post(path: "/dashboard", tokenRequired: true)
        .then((value) {
      var response = ApiResponse.fromJson(jsonDecode(value.body));
      print(response);
      if (response.success! && response.data != null) {
        final List<ResponseDashboard> resultsData = response.data['sessions'];
        // final ResponseDashboard dsessions = Sessions.fromJson(resultsData.sessions)
        print(resultsData);
        //

        // final List<Sessions> dList = resultsData.sessions.map((e) => Sessions.fromJson(e))
        //     .toList();
        // apiList.addAll(dList);
        // final List<ResponseDashboard> dList =
        // responseDashboard.sessions.map((e) => ResponseDashboard.fromJson(e)).toList();
      }
    }).catchError((onError) {
      print("ERROR $onError");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: etBackground,
      appBar: appBar(context, "Community", false, false, true),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: apiList.length,
        itemBuilder: (context, index) {
          final post = apiList[index];
          return Text(post.toString());
          //   CommunityPost(
          //   name: post['name']!,
          //   time: post['time']!,
          //   content: post['content']!,
          //   likes: post['likes']!,
          //   comments: post['comments']!,
          // );
        },
      ),
    );
  }
}

class CommunityPost extends State<CommunityPage> {
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
