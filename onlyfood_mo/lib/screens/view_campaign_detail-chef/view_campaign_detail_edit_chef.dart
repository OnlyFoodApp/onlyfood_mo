import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ViewCampaignDetailEditChef extends StatefulWidget {
  const ViewCampaignDetailEditChef({super.key});

  @override
  State<ViewCampaignDetailEditChef> createState() =>
      _ViewCampaignDetailEditChefState();
}

class _ViewCampaignDetailEditChefState
    extends State<ViewCampaignDetailEditChef> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(), // Mũi tên bên trái
        title: const Text(
          'Campaign',
          style: TextStyle(color: Colors.black),
        ), // Tiêu đề
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView(children: [
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'On-going:',
                  style: TextStyle(
                    color: Color(0xFF96D465),
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'June 7, 2021',
                  style: TextStyle(
                    color: Color(0xFF949494),
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.circle,
                  size: 12.0,
                  color: Color(0xFF949494), // Màu sắc của chấm
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'June 20, 2021',
                  style: TextStyle(
                    color: Color(0xFF949494),
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Date Create:',
                  style: TextStyle(
                    color: Color(0xFF949494),
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'June 7, 2021',
                  style: TextStyle(
                    color: Color(0xFF949494),
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                // Xử lý khi hình vuông được nhấp
                print('Square Clicked');
              },
              child: Container(
                margin: EdgeInsets.all(
                    16.0), // Có thể điều chỉnh margin theo ý muốn
                decoration: BoxDecoration(
                  // color: Colors.grey[200], // Màu nền của Container bọc ngoài
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://cdn.tgdd.vn/Files/2021/08/23/1377184/15-mon-an-dac-san-trung-quoc-noi-tieng-ma-ban-khong-nen-bo-lo-202108231441032708.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Positioned(
                        //   top: 16.0,
                        //   left: 16.0,
                        //   child: Container(
                        //     padding: const EdgeInsets.all(8.0),
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(8.0),
                        //     ),
                        //     child: const Text(
                        //       '\$10.99',
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   top: 110,
                        //   left: 16,
                        //   child: Container(
                        //     padding: const EdgeInsets.all(8.0),
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(8.0),
                        //     ),
                        //     child: const Text(
                        //       '4,5/5',
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          bottom: 16.0,
                          right: 16.0,
                          child: InkWell(
                            onTap: () {
                              print('Edit Button Clicked');
                              // Đặt logic xử lý khi nút được nhấp ở đây
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(Icons.insert_photo,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        // Positioned(
                        //   bottom: 16.0,
                        //   right: 72.0,
                        //   child: InkWell(
                        //     onTap: () {
                        //       print('Delete Button Clicked');
                        //       // Đặt logic xử lý khi nút được nhấp ở đây
                        //     },
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           borderRadius: BorderRadius.circular(10)),
                        //       padding: const EdgeInsets.all(8.0),
                        //       child:
                        //           const Icon(Icons.delete, color: Colors.black),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Food name',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Bio',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
