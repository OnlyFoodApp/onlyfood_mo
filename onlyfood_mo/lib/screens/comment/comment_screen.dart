import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:onlyfood_mo/models/comment.dart';

/////////////////////////////////////////////
///call api post////////////////////
Future<List<Comment>> fetchComment() async {
  late String id = '';
  final response = await http.get(
    Uri.parse('https://onlyfoods.azurewebsites.net/api/v1/comments/' + id),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final List<dynamic> data = jsonData['data'];

    if (data is List) {
      int dataLength = data.length;
      List<Comment> comments =
          data.map((data) => Comment.fromJson(data)).toList();
      print("data: " + comments.length.toString());
      return comments;
    } else {
      throw Exception('Data is not in the expected format');
    }
  } else {
    throw Exception('Failed to load post');
  }
}

///////////////////////////

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late Future<List<Comment>> listComment;

  @override
  void initState() {
    super.initState();
    listComment = fetchComment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Thực hiện các hành động khi nhấn nút back
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Comments', style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      child: SvgPicture.asset(
                        "assets/default_avatar.svg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      width: 260,
                      height: 50,
                      padding: EdgeInsets.only(left: 10, top: 5, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Phat ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                              Icon(
                                Icons.edit,
                                size: 16,
                                color: Colors.black87,
                              ),
                            ],
                          ),
                          Text("Ngon lam moi nguoi nen thu",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        ],
                      )),
                  Container(
                    width: 80,
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 5, top: 5),
                          child: Text("June 7, 2023",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Colors.grey)),
                        ),
                        Icon(
                          Icons.delete_outline,
                          size: 23,
                          color: Colors.black87,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
