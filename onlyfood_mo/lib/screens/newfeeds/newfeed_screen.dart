import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlyfood_mo/main.dart';
import 'package:onlyfood_mo/models/post.dart';

import 'package:http/http.dart' as http;
import 'package:onlyfood_mo/screens/cart/view_my_cart.dart';
import 'package:onlyfood_mo/screens/comment/comment_screen.dart';
import 'package:onlyfood_mo/screens/home_dashboard-chef/home_dashboad_chef.dart';

import 'package:shared_preferences/shared_preferences.dart';

/////////////////////////////////////////////
///call api post////////////////////
Future<List<Post>> fetchPost() async {
  final response = await http.get(
    Uri.parse('https://onlyfoods.azurewebsites.net/api/v1/posts/all'),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final List<dynamic> data = jsonData['data'];

    if (data is List) {
      int dataLength = data.length;
      List<Post> posts = data.map((data) => Post.fromJson(data)).toList();
      print("data: " + posts.length.toString());
      return posts;
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
    'https://i.pinimg.com/564x/4e/e3/2a/4ee32a3244fbdad41582edfd382b2b27.jpg',
    'https://i.pinimg.com/564x/01/a8/b2/01a8b20022d3ac8d1c0ad960e7b67466.jpg',
    'https://i.pinimg.com/736x/20/e7/a0/20e7a07ca164e7c73a1dbe57faa2f591.jpg',
    'https://i.pinimg.com/564x/45/8a/95/458a952b0cec06c69c6b0833cff9d312.jpg',
    'https://i.pinimg.com/736x/05/cd/f2/05cdf23aac8d84794b69fdf219967716.jpg',
    'https://i.pinimg.com/564x/4b/34/6f/4b346f43bee385e396edcf23c0c3288b.jpg',
  ];

  late Future<List<Post>> listPost;

  @override
  void initState() {
    super.initState();
    listPost = fetchPost();
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
            icon: const Icon(Icons.storefront, color: Colors.black),
            onPressed: () {
              // Thực hiện các hành động khi nhấn nút menu
              // Hiển thị menu hoặc thực hiện các hành động tùy thuộc vào ý muốn của bạn
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (HomeDashboadChef()),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {
              // Thực hiện các hành động khi nhấn nút menu
              // Hiển thị menu hoặc thực hiện các hành động tùy thuộc vào ý muốn của bạn
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewMyCart(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: listPost,
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
            // Ví dụ: posts.data.title để truy cập tiêu đề bài viết.
            return ListView.builder(
              itemCount:
                  snapshot.data?.length, // Số lượng bài viết bạn muốn hiển thị.
              itemBuilder: (context, index) {
                return Column(
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
                        Text(
                          (snapshot.data?[index].account
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
                      snapshot.data![index].mediaURLs,
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
                                  text: snapshot.data?[index].content,
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
