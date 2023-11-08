import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlyfood_mo/main.dart';
import 'package:onlyfood_mo/models/postcampaign.dart';

import 'package:http/http.dart' as http;
import 'package:onlyfood_mo/screens/comment/comment_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

/////////////////////////////////////////////
///call api post////////////////////
Future<List<PostCampaign>> fetchPostCampaign() async {
  final response = await http.get(
    Uri.parse('https://onlyfoods.azurewebsites.net/api/v1/campaigns/all'),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final List<dynamic> data = jsonData['data'];

    if (data is List) {
      int dataLength = data.length;
      List<PostCampaign> postscampaign =
          data.map((data) => PostCampaign.fromJson(data)).toList();
      print("data: " + postscampaign.length.toString());
      return postscampaign;
    } else {
      throw Exception('Data is not in the expected format');
    }
  } else {
    throw Exception('Failed to load post');
  }
}

///////////////////////////

class NewfeedScreen extends StatefulWidget {
  const NewfeedScreen({Key? key}) : super(key: key);

  @override
  _NewfeedScreenState createState() => _NewfeedScreenState();
}

class _NewfeedScreenState extends State<NewfeedScreen> {
  List<String> postImage = [
    'https://i.pinimg.com/564x/9e/9f/f4/9e9ff43fad6077d06c01e740327b555d.jpg',
    'https://i.pinimg.com/564x/55/6f/97/556f97290b01ffb97d1ca63669958267.jpg',
    'https://i.pinimg.com/564x/e4/a3/c8/e4a3c8294c89baec96c58faeb456dee6.jpg',
    'https://i.pinimg.com/564x/f2/bb/49/f2bb49eaf96afedf59f39fc508650364.jpg',
    'https://i.pinimg.com/564x/6f/96/e2/6f96e2ac3a39d7561fcc35c96b648903.jpg',
    'https://i.pinimg.com/564x/20/07/26/200726a6f1176021c24f8e70443f34bf.jpg',
  ];

  late Future<List<PostCampaign>> listPostCampaign;

  @override
  void initState() {
    super.initState();
    listPostCampaign = fetchPostCampaign();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/logo_only_food.png', // Đường dẫn đến hình ảnh logo
              width: 40, // Kích thước của hình ảnh
            ),
            const SizedBox(width: 8), // Khoảng cách giữa biểu tượng và tiêu đề
            const Text(
              'OnlyFood',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {
              // Thực hiện các hành động khi nhấn nút menu
              // Hiển thị menu hoặc thực hiện các hành động tùy thuộc vào ý muốn của bạn
            },
          ),
        ],
      ),
      body: FutureBuilder<List<PostCampaign>>(
        future: listPostCampaign,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Hiển thị một tiến trình đang tải nếu đang trong quá trình lấy dữ liệu từ API.
            print('Loading.....');
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
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
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
            return Text('No data available.');
          } else {
            // Hiển thị danh sách bài viết từ API ở đây.
            // Ví dụ: postscampaign.data.title để truy cập tiêu đề bài viết.
            return ListView.builder(
              itemCount:
                  snapshot.data?.length, // Số lượng bài viết bạn muốn hiển thị.
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Header PostCampaign
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
                        Text(
                          (snapshot.data?[index].chef
                                  as Map<String, dynamic>?)?['username'] ??
                              "", // Sử dụng as Map<String, dynamic>,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                          icon:
                              const Icon(Icons.more_vert, color: Colors.black),
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
                          icon: const Icon(Icons.share, color: Colors.black),
                        ),
                        const SizedBox(
                          width: 165,
                        ),
                        Container(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                                  text: "Description: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: snapshot.data?[index].description,
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: " and"),
                                TextSpan(
                                  text: " others",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              // Truyền dữ liệu cần thiết sang màn hình danh sách bình luận
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CommentScreen(
                                    postId: snapshot.data?[index]
                                        .id, // Truyền postId hoặc dữ liệu liên quan đến bình luận
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "View all comments",
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
