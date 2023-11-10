import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:onlyfood_mo/models/comment.dart';

/////////////////////////////////////////////
///call api comment////////////////////
///////GET//////////////////
Future<List<Comment>> fetchComment(String postId) async {
  // late String id = '';
  final response = await http.get(
    Uri.parse('https://onlyfoods.azurewebsites.net/api/v1/comments/$postId'),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final List<dynamic> data = jsonData['data'];

    if (data is List) {
      int dataLength = data.length;
      List<Comment> comments =
          data.map((data) => Comment.fromJson(data)).toList();
      print(comments);
      return comments;
    } else {
      throw Exception('Data is not in the expected format');
    }
  } else {
    throw Exception('Failed to load comments');
  }
}

class CommentScreen extends StatefulWidget {
  final String? postId;
  const CommentScreen({super.key, this.postId});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late Future<List<Comment>> listComment;

  @override
  void initState() {
    super.initState();
    listComment = fetchComment(widget.postId ?? '');
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<List<Comment>>(
              future: listComment,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Hiển thị một tiến trình đang tải nếu đang trong quá trình lấy dữ liệu từ API.
                  return Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            // you can replace this with Image.asset
                            'assets/logo_only_food.png',
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ),
                          // you can replace
                          const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.black),
                            strokeWidth: 2,
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  // Hiển thị thông báo lỗi nếu có lỗi xảy ra.
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  // Hiển thị thông báo nếu không có dữ liệu được trả về.
                  return const Text('No data available.');
                } else {
                  // Hiển thị danh sách bình luận từ API ở đây.
                  // Ví dụ: comments[index].content để truy cập nội dung bình luận.
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return SafeArea(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50,
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 10),
                              child: Row(
                                children: [
                                  SizedBox(
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
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  snapshot.data?[index]
                                                          .username ??
                                                      "",
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  )),
                                              const Icon(
                                                Icons.edit,
                                                size: 16,
                                                color: Colors.black87,
                                              ),
                                            ],
                                          ),
                                          Text(snapshot.data?[index].text ?? "",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ],
                                      )),
                                  SizedBox(
                                    width: 80,
                                    height: 50,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, top: 5),
                                          child: const Text("June 7, 2023",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13,
                                                  color: Colors.grey)),
                                        ),
                                        const Icon(
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
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(30), // Điều này tạo viền tròn
                        color: Colors.grey[200], // Màu nền
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                            hintText: "Add a new comment...",
                            border: InputBorder.none, // Ẩn viền của TextField
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 94, 91,
                                    91)) // Khoảng cách từ nội dung đến viền
                            ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút "Submit"
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
