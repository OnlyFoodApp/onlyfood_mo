import 'package:flutter/material.dart';

class ViewMyCart extends StatefulWidget {
  const ViewMyCart({super.key});

  @override
  State<ViewMyCart> createState() => _ViewMyCartState();
}

class _ViewMyCartState extends State<ViewMyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(), // Mũi tên bên trái
          title: const Text(
            'My Cart',
            style: TextStyle(color: Colors.black),
          ), // Tiêu đề
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: ListView(children: const [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image(
                    image: AssetImage("assets/images/1.png"),
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text("Bánh mì",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Text("10.000đ",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.remove_circle,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("1",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ]),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image(
                    image: AssetImage("assets/images/1.png"),
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text("Bánh mì",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Text("10.000đ",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.remove_circle,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("1",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ]),
        ]));
  }
}
