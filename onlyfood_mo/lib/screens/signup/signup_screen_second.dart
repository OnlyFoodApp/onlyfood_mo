
import 'package:flutter/material.dart';
import 'package:onlyfood_mo/utils/colors.dart';
import 'package:onlyfood_mo/widgets/text_field_input.dart';

class SignUpScreenSecond extends StatefulWidget {
  const SignUpScreenSecond({Key? key}) : super(key: key);

  @override
  createState() => _SignUpScreenSecondState();
}

class _SignUpScreenSecondState extends State<SignUpScreenSecond> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity, // vô cùng
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              //Flexible là một widget trong Flutter cho phép bạn chỉ định
              // một phần trăm của không gian màn hình dành cho một widget
              // con cụ thể.
              //logo image
              Image.asset(
                "assets/logo_only_food.png",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
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
              // Text field input for email
              TextFieldInput(
                // cai nay la widget tu customize ben kia do
                hintText: 'Phone, email or username',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 24,
              ),

              //Text field input for password
              TextFieldInput(
                  // cai nay la widget tu customize ben kia do
                  hintText: 'Password ',
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,
                  isPass: true),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                // cai nay la widget tu customize ben kia do
                hintText: 'Confirm Pasword ',
                textInputType: TextInputType.text,
                textEditingController: _confirmPasswordController,
              ),
              const SizedBox(
                height: 24,
              ),
              //button login
              InkWell(
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
                    child: const Text(
                      "Sign Up", // Thay đổi văn bản theo ngôn ngữ mong muốn
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //transitioning to signing up

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text(
                      "Account already?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text(
                        "Sign In?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
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
                height: 12,
              ),

              InkWell(
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

              Flexible(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
