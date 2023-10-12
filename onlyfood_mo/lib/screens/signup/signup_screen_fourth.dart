import 'package:flutter/material.dart';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlyfood_mo/utils/colors.dart';
import 'package:onlyfood_mo/widgets/text_field_input.dart';

class SignUpScreenFourth extends StatefulWidget {
  const SignUpScreenFourth({Key? key}) : super(key: key);

  @override
  createState() => _SignUpScreenFourthState();
}

class _SignUpScreenFourthState extends State<SignUpScreenFourth> {
  @override
  Widget build(BuildContext context) {
    int selectedOption = 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Loại bỏ shadow
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            // Xử lý khi nút đóng được nhấn
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            "Complete profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.black,
            ),
            onPressed: () {
              // Hiển thị hộp thoại xác nhận khi nút đồng ý được nhấn
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Xác nhận"),
                    backgroundColor: Colors.white,
                    content: const Column(
                      mainAxisSize:
                          MainAxisSize.min, // cái này làm cho column ko dài nữa
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Are you sure you want to accept this?",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 14), // Khoảng cách giữa các dòng
                        Text(
                          "Remember that your “role” cannot be changed after pressing Yes, Confirm",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Xử lý khi nút "Không" được nhấn
                          Navigator.of(context).pop();
                        },
                        child: const Text("No, Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          // Xử lý khi nút "Có" được nhấn
                          Navigator.of(context).pop();
                          // Thực hiện hành động cần thiết sau khi đồng ý
                        },
                        child: const Text("Yes, confirm"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300], // Màu nền cho CircleAvatar
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SvgPicture.asset(
                      "assets/default_avatar.svg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Xử lý khi nút camera được nhấn
                        // Mở hộp thoại hoặc thực hiện hành động cần thiết
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "First name",
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .black), // Màu của border khi không focus
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue), // Màu của border khi focus
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Last name",
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .black), // Màu của border khi không focus
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue), // Màu của border khi focus
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  hintText: "User name",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black), // Màu của border khi không focus
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue), // Màu của border khi focus
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Date of birth",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black), // Màu của border khi không focus
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue), // Màu của border khi focus
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Bio",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black), // Màu của border khi không focus
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue), // Màu của border khi focus
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Are you a regular user or a chef?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    title: const Text('Regular User',
                        style: TextStyle(color: Colors.black)),
                    leading: Radio<int>(
                      value: 1,
                      groupValue: selectedOption,
                      activeColor: Colors
                          .black, // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(
                          Colors.black), // Change the fill color when selected
                      splashRadius: 20, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Chef',
                        style: TextStyle(color: Colors.black)),
                    leading: Radio<int>(
                      value: 2,
                      groupValue: selectedOption,
                      activeColor: Colors
                          .black, // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(
                          Colors.black), // Change the fill color when selected
                      splashRadius: 25, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
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
