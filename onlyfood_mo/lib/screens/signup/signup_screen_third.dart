import 'package:flutter/material.dart';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlyfood_mo/utils/colors.dart';
import 'package:onlyfood_mo/widgets/text_field_input.dart';

class SignUpScreenThird extends StatefulWidget {
  const SignUpScreenThird({Key? key}) : super(key: key);

  @override
  createState() => _SignUpScreenThirdState();
}

class _SignUpScreenThirdState extends State<SignUpScreenThird> {
  @override
  Widget build(BuildContext context) {
    List<TextEditingController> otpControllers =
        List.generate(4, (index) => TextEditingController());
    List<FocusNode> otpFocusNodes = List.generate(4, (index) => FocusNode());

    @override
    void dispose() {
      for (var controller in otpControllers) {
        controller.dispose();
      }
      for (var focusNode in otpFocusNodes) {
        focusNode.dispose();
      }
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Loại bỏ shadow
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black, // Đặt màu đen cho biểu tượng nút back
          ),
          onPressed: () {
            Navigator.pop(context);
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
                child: SvgPicture.asset(
                  "assets/verification_code.svg",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Verification Code",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Please type the verification code send to user@gmail.com",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => SizedBox(
                      width: 50,
                      height: 50,
                      child: TextField(
                        controller: otpControllers[index],
                        focusNode: otpFocusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            if (index < otpControllers.length - 1) {
                              FocusScope.of(context)
                                  .requestFocus(otpFocusNodes[index + 1]);
                            } else {
                              // Đã nhập đủ số ký tự
                              String otp = otpControllers
                                  .map((controller) => controller.text)
                                  .join();
                              print("Entered OTP: $otp");
                            }
                          }
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFEEEEEE),
                          counterText: "",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .blue), // Màu sắc khi ô nhập được focus
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .grey), // Màu sắc khi ô nhập không được focus
                          ),
                          // Màu sắc khi ô nhập có lỗi
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          // Màu sắc khi ô nhập không có lỗi
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Verify",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
