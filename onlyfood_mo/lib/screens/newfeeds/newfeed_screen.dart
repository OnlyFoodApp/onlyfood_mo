import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlyfood_mo/main.dart';
import 'package:onlyfood_mo/models/post.dart';

import 'package:http/http.dart' as http;

/////////////////////////////////////////////
///call api post////////////////////

///////////////////////////

class NewfeedScreen extends StatefulWidget {
  const NewfeedScreen({Key? key}) : super(key: key);

  @override
  _NewfeedScreenState createState() => _NewfeedScreenState();
}

class _NewfeedScreenState extends State<NewfeedScreen> {
  List<String> postImage = [
    'https://m.media-amazon.com/images/I/B149KwK4IJS._AC_UF1000,1000_QL80_.jpg',
    'https://i.pinimg.com/564x/01/a8/b2/01a8b20022d3ac8d1c0ad960e7b67466.jpg',
    'https://i.pinimg.com/736x/20/e7/a0/20e7a07ca164e7c73a1dbe57faa2f591.jpg',
    'https://i.pinimg.com/564x/45/8a/95/458a952b0cec06c69c6b0833cff9d312.jpg',
    'https://m.media-amazon.com/images/I/B149KwK4IJS._AC_UF1000,1000_QL80_.jpg',
    'https://m.media-amazon.com/images/I/B149KwK4IJS._AC_UF1000,1000_QL80_.jpg',
    'https://m.media-amazon.com/images/I/B149KwK4IJS._AC_UF1000,1000_QL80_.jpg',
    'https://m.media-amazon.com/images/I/B149KwK4IJS._AC_UF1000,1000_QL80_.jpg',
    'https://m.media-amazon.com/images/I/B149KwK4IJS._AC_UF1000,1000_QL80_.jpg',
    'https://m.media-amazon.com/images/I/B149KwK4IJS._AC_UF1000,1000_QL80_.jpg',
    'https://m.media-amazon.com/images/I/B149KwK4IJS._AC_UF1000,1000_QL80_.jpg',
  ];

  List<Post> posts = [];

  Future<List<Post>> fetchPost() async {
    final uri = Uri.parse('https://onlyfoods.azurewebsites.net/api/v1/posts');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return posts;
    } else {
      throw Exception('Failed to load post');
    }
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
        title: const Text('OnlyFood', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Thực hiện các hành động khi nhấn nút menu
              // Hiển thị menu hoặc thực hiện các hành động tùy thuộc vào ý muốn của bạn
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Hiển thị một tiến trình đang tải nếu đang trong quá trình lấy dữ liệu từ API.
            print('Loading.....');
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Hiển thị thông báo lỗi nếu có lỗi xảy ra.
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            // Hiển thị thông báo nếu không có dữ liệu được trả về.
            return Text('No data available.');
          } else {
            // Hiển thị danh sách bài viết từ API ở đây.
            // Ví dụ: posts.data.title để truy cập tiêu đề bài viết.
            // print('Data: ', snapshot.data);
            return ListView.builder(
              itemCount:
                  snapshot.data?.length, // Số lượng bài viết bạn muốn hiển thị.
              itemBuilder: (context, index) {
                return Column(
                  children: List.generate(
                    10,
                    (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Header Post
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.grey[300],
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/default_avatar.svg",
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Text(
                              "User",
                              style: TextStyle(color: Colors.black),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.more_vert,
                                  color: Colors.black),
                              onPressed: () {
                                // Thực hiện các hành động khi nhấn nút menu
                                // Hiển thị menu hoặc thực hiện các hành động tùy thuộc vào ý muốn của bạn
                              },
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "On-going: ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 160, 143, 93),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "June 7 2021",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              " - ",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "June 20 2021",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Image post

                        Image.network(
                          postImage[index % postImage.length],
                          width: double.infinity,
                          height: 400,
                          fit: BoxFit.cover,
                        ),

                        //Footer post

                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border,
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.chat_bubble_outline,
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.share, color: Colors.black),
                            ),
                            const SizedBox(
                              width: 165,
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                ),
                                child: const Row(
                                  children: [
                                    Text(
                                      "Order",
                                      style: TextStyle(
                                          color: Colors
                                              .white), // Thiết lập màu văn bản là trắng
                                    ),
                                    Icon(
                                      Icons.shopping_bag,
                                      color: Colors.white,
                                      size: 20,
                                    ), // Thiết lập màu biểu tượng là trắng
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: "Description:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(text: "Like by "),
                                    TextSpan(
                                      text: "User",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(text: " and"),
                                    TextSpan(
                                      text: " others",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  "View all comments",
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
