import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewPostDetail extends StatefulWidget {
  const ViewPostDetail({super.key});

  @override
  State<ViewPostDetail> createState() => _ViewPostDetailState();
}

class _ViewPostDetailState extends State<ViewPostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(), // Mũi tên bên trái
        title: const Text(
          'Posts',
          style: TextStyle(color: Colors.black),
        ), // Tiêu đề
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView(children: [
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      child: SvgPicture.asset(
                        "assets/default_avatar.svg",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Phat',
                    style: TextStyle(
                      color: Color(0xFF949494),
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.more_vert,
                      size: 30, color: Colors.black // Màu sắc của chấm
                      ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          ),

          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'On-going:',
                style: TextStyle(
                  color: Color(0xFF96D465),
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'June 7, 2021',
                style: TextStyle(
                  color: Color(0xFF949494),
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.circle,
                size: 12.0,
                color: Color(0xFF949494), // Màu sắc của chấm
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'June 20, 2021',
                style: TextStyle(
                  color: Color(0xFF949494),
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     SizedBox(
          //       width: 20,
          //     ),
          //     Text(
          //       'Completed:',
          //       style: TextStyle(
          //         color: Color(0xFF96D465),
          //         fontSize: 15,
          //         fontFamily: 'Roboto',
          //         fontWeight: FontWeight.w700,
          //         height: 1,
          //       ),
          //     ),
          //     Text(
          //       'June 7, 2021',
          //       style: TextStyle(
          //         color: Color(0xFF949494),
          //         fontSize: 15,
          //         fontFamily: 'Roboto',
          //         fontWeight: FontWeight.w400,
          //         height: 1,
          //       ),
          //     ),
          //     Icon(
          //       Icons.circle,
          //       size: 12.0,
          //       color: Color(0xFF949494), // Màu sắc của chấm
          //     ),
          //     Text(
          //       'June 20, 2021',
          //       style: TextStyle(
          //         color: Color(0xFF949494),
          //         fontSize: 15,
          //         fontFamily: 'Roboto',
          //         fontWeight: FontWeight.w400,
          //         height: 1,
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 10,
          ),
          //picture here
          Container(
            width: 400,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //instagram action bar here
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.comment_outlined,
                    size: 28,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.send_sharp,
                    size: 26,
                    color: Colors.black,
                  ),
                ],
              ),
              Container(
                color: Colors.grey[300],
                padding: const EdgeInsets.only(top: 7, right: 10, left: 7, bottom: 7),
                margin: const EdgeInsets.only(right: 10),
                child: const Row(
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 28,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Order',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Description:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Ngon lam moi nguoi nen thu, co nhieu...',
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //numbers of like here
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                '1,000 likes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //comments here
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'View all 100 comments',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              //some instagram comments here
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Column(children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Khoa',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Tuyet voi luon, tui se mua",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Kiet',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Them qua troi luonnn",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ],
            )
          ])
        ]),
      ]),
    );
  }
}
