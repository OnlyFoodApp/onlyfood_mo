import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificateScreen extends StatefulWidget {
  NotificateScreen({Key? key}) : super(key: key);

  @override
  _NotificateScreenState createState() => _NotificateScreenState();
}

class _NotificateScreenState extends State<NotificateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Notifications',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 60,
                    height: 60,
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
                    padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Phat",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "Followed You",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 50,
                    padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Food Name | Chef's Name",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "Bạn đã đặt món ăn này!",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    child: const Icon(
                      Icons.check_circle_outline,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 50,
                    padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Đã thánh toán đơn hàng!",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "Date: 27/11/2023",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
