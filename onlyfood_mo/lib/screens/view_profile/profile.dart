import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        title: const Text('Tên User', style: TextStyle(color: Colors.black)),
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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
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
                    const SizedBox(width: 25),
                    const Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              // Để căn giữa theo chiều dọc
                              children: [
                                Text(
                                  '880',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        18, // Có thể điều chỉnh kích thước phù hợp
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        8), // Khoảng cách giữa hai đoạn văn bản
                                Text(
                                  'Post',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        16, // Có thể điều chỉnh kích thước phù hợp
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              // Để căn giữa theo chiều dọc
                              children: [
                                Text(
                                  '14,1k',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        18, // Có thể điều chỉnh kích thước phù hợp
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        8), // Khoảng cách giữa hai đoạn văn bản
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        16, // Có thể điều chỉnh kích thước phù hợp
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              // Để căn giữa theo chiều dọc
                              children: [
                                Text(
                                  '1000',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        18, // Có thể điều chỉnh kích thước phù hợp
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        8), // Khoảng cách giữa hai đoạn văn bản
                                Text(
                                  'Following',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        16, // Có thể điều chỉnh kích thước phù hợp
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'User',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Bio: abcxyz',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mainstreet 19, Ukraine 2200',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        // Màu của nền button khi được nhấn
                        overlayColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 59, 57, 57)),
                        // Viền của button
                        side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(color: Colors.grey)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icon_message_messenger.svg",
                            width: 30,
                            height: 25,
                            color: Colors.white,
                          ),
                          const Text(
                            'Message',
                            style: TextStyle(
                              color: Colors
                                  .white, // Đặt màu của văn bản thành màu trắng
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        // Màu của nền button khi được nhấn
                        overlayColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 237, 228, 228)),
                        // Viền của button
                        side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(color: Colors.white)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icon_user_follow_add.svg",
                            width: 30,
                            height: 25,
                            color: Colors.black,
                          ),
                          const Text(
                            'Follow',
                            style: TextStyle(
                              color: Colors
                                  .black, // Đặt màu của văn bản thành màu trắng
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
