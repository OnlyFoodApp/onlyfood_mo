import 'package:flutter/material.dart';
import 'package:onlyfood_mo/utils/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      this.isPass = false,
      required this.textInputType})
      : super(key: key); //constructor

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide:
            Divider.createBorderSide(context)); // cái này là đường viền nè
    // biến inputBorder này đc khai báo ở đây vì tính biến đổi của nó
    //còn các biến kia thì ko có sự thay đổi

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: hintTextColor),
        border: inputBorder,
        focusedBorder:
            inputBorder, // khi mà click vào input đường viền inputBorder hiện lên
        enabledBorder: inputBorder, // điền rồi thì cái inputBorder vẫn hiển thị
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        fillColor: fillInputcolor,
      ),
      style: const TextStyle(color: Colors.black),
      keyboardType: textInputType,
      obscureText: isPass, // ẩn đi **** như password
    );
  }
}
