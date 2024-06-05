import 'dart:convert';
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:schedule/api/ApiBaseService.dart';
import 'package:schedule/models/ApiResponse.dart';
import 'package:schedule/models/ResponseDashboard.dart';
import '../utils/ClassWidgets.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List<Notifications> notifications = [];
  List<ResponseDashboard> dashResponse = [];
  List<Sessions> sessions = [];
  List<Banners> banners = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    dashboardApi();
  }

  Future<void> dashboardApi() async {
    try {
      final response =
          await ApiBaseService().post(path: "/dashboard", tokenRequired: true);
      final jsonResponse = jsonDecode(response.body);
      ApiResponse apiResponse = ApiResponse.fromJson(jsonResponse);
      if (apiResponse.success! && apiResponse.data != null) {
        // for (Map j in apiResponse.data) {
        //   ResponseDashboard responseDashboard = ResponseDashboard(
        //       notification: j["notification"], banners: j["banners"]);
        //   dashResponse.add(responseDashboard);
        //   print(dashResponse);
        // }

        notifications.clear();
        for (Map i in apiResponse.data["notification"]) {
          notifications.add(Notifications.fromJson(i));
        }
        print("api dataaaaaaa $notifications");
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print("ERROR: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: etBackground,
      appBar: appBar(context, "Community", false, false, true),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final post = notifications[index];
                return CommunityPost(
                  name: post.receiverType ?? '',
                  time: post.createdAt ?? '',
                  content: post.slug ?? '',
                  likes: post.status ?? '0',
                  comments: post.id ?? 0,
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
  final int comments;

  const CommunityPost({
    Key? key,
    required this.name,
    required this.time,
    required this.content,
    required this.likes,
    required this.comments,
  }) : super(key: key);
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 4,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(time),
                    ],
                  ),
                ),
                Icon(Icons.share, color: Colors.grey),
              ],
            ),
          ),
          Divider(color: etBackground),
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
              SizedBox(width: 7),
              Row(
                children: [
                  Icon(Icons.comment, color: Colors.orange),
                  SizedBox(width: 3),
                  Text(comments.toString()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
