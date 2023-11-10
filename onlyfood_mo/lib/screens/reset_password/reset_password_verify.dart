import 'package:flutter/material.dart';


import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlyfood_mo/utils/colors.dart';

class ResetPassWordVerify extends StatefulWidget {
  const ResetPassWordVerify({Key? key}) : super(key: key);

  @override
  createState() => _ResetPassWordVerifyState();
}

class _ResetPassWordVerifyState extends State<ResetPassWordVerify> {
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
        child: SizedBox(
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
                          fillColor: Color(0xFFEEEEEE),
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
