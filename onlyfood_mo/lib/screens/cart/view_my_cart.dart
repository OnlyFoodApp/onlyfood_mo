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
          backgroundColor: const Color.fromRGBO(248, 239, 233, 1),

          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        backgroundColor: const Color.fromRGBO(248, 239, 233, 1),
        body: ListView(children: [
          Column(children: [
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white, // Màu nền
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                          child: const SizedBox(
                            width: 80,
                            height: 80,
                            child: Image(
                              image: AssetImage("assets/images/1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
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
                    const Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.remove_circle_outline,
                              color: Color.fromRGBO(196, 20, 23, 1),
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
                              Icons.add_circle,
                              color: Color.fromRGBO(196, 20, 23, 1),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white, // Màu nền
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                          child: const SizedBox(
                            width: 80,
                            height: 80,
                            child: Image(
                              image: AssetImage("assets/images/1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
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
                    const Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.remove_circle_outline,
                              color: Color.fromRGBO(196, 20, 23, 1),
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
                              Icons.add_circle,
                              color: Color.fromRGBO(196, 20, 23, 1),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  ]),
            )
          ]),
          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("SubTotal: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      SizedBox(
                        width: 70,
                      ),
                      Text("20.000d",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("Shipping: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      SizedBox(
                        width: 70,
                      ),
                      Text("10.000",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("Total: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      SizedBox(
                        width: 105,
                      ),
                      Text("20.000đ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ],
              )),
          Container(
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: const Color.fromRGBO(196, 20, 23, 1)),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Check Out",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]));
  }
}
