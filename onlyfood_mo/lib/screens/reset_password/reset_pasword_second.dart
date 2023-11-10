import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlyfood_mo/utils/colors.dart';
import 'package:onlyfood_mo/widgets/text_field_input.dart';

class ResetPasswordSecond extends StatefulWidget {
  const ResetPasswordSecond({Key? key}) : super(key: key);

  @override
  createState() => _ResetPasswordSecondState();
}

class _ResetPasswordSecondState extends State<ResetPasswordSecond> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
                  "New Password",
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
                  hintText: 'New password ',
                  textInputType: TextInputType.text,
                  textEditingController: _newPasswordController,
                  isPass: true),
              const SizedBox(
                height: 24,
              ),

              TextFieldInput(
                  // cai nay la widget tu customize ben kia do
                  hintText: 'Confirm new password ',
                  textInputType: TextInputType.text,
                  textEditingController: _confirmPasswordController,
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
                  child: const Text("Reset password"),
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
