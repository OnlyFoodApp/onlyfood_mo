import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewCampaign extends StatefulWidget {
  const AddNewCampaign({Key? key}) : super(key: key);
  @override
  createState() => _CampaignState();
}

class _CampaignState extends State<AddNewCampaign> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  TextEditingController dateStartInputController = TextEditingController();
  TextEditingController dateEndInputController = TextEditingController();

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
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Xử lý khi nút camera được nhấn
                        // Mở hộp thoại hoặc thực hiện hành động cần thiết
                      },
                    ),
                    const Text(
                      'Photo',
                      style: TextStyle(
                          height: 8, fontSize: 10, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.black, height: 1),
                      decoration: InputDecoration(
                        hintText: "Campaign title",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(width: 2)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    // flex: 1,
                    child: Container(
                      height: 58,
                      padding: const EdgeInsetsDirectional.all(16.0),
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                          color: Color(0xFFF1F1F1),
                          borderRadius: BorderRadiusDirectional.horizontal(
                              start: Radius.circular(20))),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: const Icon(
                              Icons.watch_later,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            'Start Date',
                            style: TextStyle(
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
                      // padding: const EdgeInsetsDirectional.all(16.0),
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                          color: Color(0xFFF1F1F1),
                          borderRadius: BorderRadiusDirectional.horizontal(
                              end: Radius.circular(20))),
                      child: Row(
                        children: [
                          Expanded(
                            // flex: 1,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'date/month/year',
                                hintStyle: TextStyle(
                                    color: Color(0xFFA9A9A9), fontSize: 14),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              controller: dateStartInputController,
                              style: const TextStyle(color: Colors.black),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2050));

                                if (pickedDate != null) {
                                  String date = DateFormat('dd/MMM/yyyy')
                                      .format(pickedDate)
                                      .toString();
                                  dateStartInputController.text = date;
                                }
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.drive_file_rename_outline,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // Xử lý khi nút camera được nhấn
                              // Mở hộp thoại hoặc thực hiện hành động cần thiết
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    // flex: 1,
                    child: Container(
                      height: 58,
                      padding: const EdgeInsetsDirectional.all(16.0),
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                          color: Color(0xFFF1F1F1),
                          borderRadius: BorderRadiusDirectional.horizontal(
                              start: Radius.circular(20))),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: const Icon(
                              Icons.watch_later,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            'End Date',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    // flex: 1,
                    // fit: FlexFit.loose,
                    child: Container(
                      height: 58,
                      // padding: const EdgeInsetsDirectional.all(16.0),
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                          color: Color(0xFFF1F1F1),
                          borderRadius: BorderRadiusDirectional.horizontal(
                              end: Radius.circular(20))),
                      child: Row(
                        children: [
                          Expanded(
                            // flex: 1,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'date/month/year',
                                hintStyle: TextStyle(
                                    color: Color(0xFFA9A9A9), fontSize: 14),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              controller: dateEndInputController,
                              style: const TextStyle(color: Colors.black),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2050));

                                if (pickedDate != null) {
                                  String date = DateFormat('dd/MMM/yyyy')
                                      .format(pickedDate)
                                      .toString();
                                  dateEndInputController.text = date;
                                }
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.drive_file_rename_outline,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // Xử lý khi nút camera được nhấn
                              // Mở hộp thoại hoặc thực hiện hành động cần thiết
                            },
                          ),
                        ],
                      ),
                    ),
                  )
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
                  "You haven't created a menu for your campaign yet!",
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
                    "Add menu ",
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
