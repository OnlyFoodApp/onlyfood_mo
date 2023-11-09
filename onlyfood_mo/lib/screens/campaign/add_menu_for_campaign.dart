import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class AddMenuForCampaign extends StatefulWidget {
  const AddMenuForCampaign({Key? key}) : super(key: key);
  @override
  createState() => _AddMenuForCampaign();
}

class _AddMenuForCampaign extends State<AddMenuForCampaign> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            // Xử lý khi nút đóng được nhấn
            Navigator.pop(context);
          },
        ),
        title: const Text('Create Campaign'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.description,
                      size: 40,
                      color: Colors.black,
                    ),
                    Text(
                      "Menu",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    // flex: 1,
                    child: Container(
                      height: 58,
                      padding: const EdgeInsetsDirectional.all(16.0),
                      child: const Row(
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    // flex: 1,
                    // fit: FlexFit.loose,
                    child: Container(
                      height: 58,
                      padding: const EdgeInsetsDirectional.all(16.0),
                      child: const Row(
                        children: [
                          Text(
                            '0 Items',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Container(
                height: 58,
                width: 58,
                padding: const EdgeInsetsDirectional.all(16.0),
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: const Icon(
                        Icons.description,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  "You haven't add dish for your menu yet!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: const Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    "Add dish ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )
                ],
              ),
              const SizedBox(height: 30),
              TextButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(400, 50)),
                  shape: MaterialStateProperty.all(ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(19))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF555555)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
