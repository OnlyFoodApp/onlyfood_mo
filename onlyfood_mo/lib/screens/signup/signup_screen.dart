import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlyfood_mo/utils/colors.dart';
import 'package:onlyfood_mo/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity, // vô cùng
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Flexible(
              //   child: Container(),
              //   flex: 1,
              // ),
              //Flexible là một widget trong Flutter cho phép bạn chỉ định
              // một phần trăm của không gian màn hình dành cho một widget
              // con cụ thể.
              //logo image
              Container(
                margin: const EdgeInsets.only(top: 70),
                child: Image.asset(
                  "assets/logo_only_food.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Only Food",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.all(30),
                child: InkWell(
                  onTap: () {
                    // Xử lý khi người dùng nhấn vào
                  },
                  child: Ink(
                    decoration: const BoxDecoration(
                      color: buttonBlack,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Biểu tượng Facebook
                          Image.asset(
                            'assets/facebook_icon.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          // Văn bản "Tiếp tục với Facebook"
                          const Text(
                            "Continue with Facebook",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Container(
                width: 147.97,
                height: 15,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 8,
                      child: Container(
                        width: 60,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFD3D3D3),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 87.97,
                      top: 8,
                      child: Container(
                        width: 60,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFD3D3D3),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 55.53,
                      top: 0,
                      child: SizedBox(
                        width: 38.74,
                        child: Text(
                          'OR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF6D6D6D),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Sign Up With Phone or Email",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              const Column(
                children: [
                  Text(
                    'Sign up to explore and experience the best food & chef.',
                    style: TextStyle(
                      color: Color(0xFF3A3A3A),
                      fontSize: 13,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              InkWell(
                onTap: () {
                  // Xử lý khi người dùng nhấn vào
                },
                child: Ink(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Biểu tượng Facebook
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Color(0xFF6B6B6B)),
                        ),
                        SizedBox(width: 8),
                        // Văn bản "Tiếp tục với Facebook"
                        Text(
                          "Sign In.",
                          style: TextStyle(
                              color: Color(0xFF6D6D6D),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
