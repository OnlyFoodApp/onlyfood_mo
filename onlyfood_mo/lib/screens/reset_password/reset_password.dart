import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlyfood_mo/utils/colors.dart';
import 'package:onlyfood_mo/widgets/text_field_input.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity, // vô cùng
          margin: const EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Flexible là một widget trong Flutter cho phép bạn chỉ định
              // một phần trăm của không gian màn hình dành cho một widget
              // con cụ thể. (no la flex day)
              //logo image
              SvgPicture.asset(
                "assets/icon_lock.svg",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Reset password",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              const SizedBox(height: 40),
              // Text field input for email
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Please enter your email address to request a password reset",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              const SizedBox(height: 40),
              //Text field input for password
              TextFieldInput(
                  // cai nay la widget tu customize ben kia do
                  hintText: 'Password ',
                  textInputType: TextInputType.text,
                  textEditingController: _emailController,
                  isPass: true),
              const SizedBox(
                height: 24,
              ),
              //button login
              InkWell(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      color: buttonBlack),
                  child: const Text("Send"),
                ),
              ),

              //transitioning to signing up

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
