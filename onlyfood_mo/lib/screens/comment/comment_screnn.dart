import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Comments',
            style: TextStyle(color: Colors.black),
          ), // Tiêu đề
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
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
                          const Row(
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
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        )));
  }
}
