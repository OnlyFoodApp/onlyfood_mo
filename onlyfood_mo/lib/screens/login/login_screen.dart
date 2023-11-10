import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:onlyfood_mo/responsive/mobile_screen_layout.dart';
import 'package:onlyfood_mo/screens/signup/signup_screen.dart';
import 'package:onlyfood_mo/utils/colors.dart';
import 'package:onlyfood_mo/widgets/text_field_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false; // Variable to track loading state
  Future<Map<String, dynamic>> login() async {
    setState(() {
      _isLoading =
          true; // Set loading state to true when the login process starts
    });
    try {
      //call api to get token
      String urlString =
          'https://onlyfoods.azurewebsites.net/api/v1/auth/login';
      Uri url = Uri.parse(urlString);
      Map<String, String> headers = {"Content-type": "application/json"};
      //get email and password from inputfieldtext
      String email = _emailController.text;
      String password = _passwordController.text;
      //map email and password to json file
      Map<String, dynamic> jsonData = {
        "email": email,
        "password": password,
      };

      String json = jsonEncode(jsonData);

      List<dynamic> responses = await Future.wait([
        post(url, headers: headers, body: json), // Your API call
        // Add more asynchronous tasks here if needed
      ]);

      Response apiResponse = responses[0];
      //start call api
      // final response = await post(url, headers: headers, body: json);
      //end call api and return status code
      int statusCode = apiResponse.statusCode;
      if (statusCode == 200) {
        SharedPreferences prefs =
            await SharedPreferences.getInstance(); // SAVE JWT
        String token = apiResponse.body;
        Map<String, dynamic> user = JwtDecoder.decode(token);
        await prefs.setString('jwt', token); // SAVE JWT
        await prefs.setString('accountId', user["Id"]);
        await prefs.setString('role', user["Role"]);
        print("Token when we get inside pref: " +
            prefs.getString("jwt").toString());

        String role = user["Role"];
        // Check if the widget is still mounted before navigating
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MobileScreenLayout(),
          ),
        );
        return user;
      } else {
        throw Exception('Failed to log in');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity, // vô cùng
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                  //Flexible là một widget trong Flutter cho phép bạn chỉ định
                  // một phần trăm của không gian màn hình dành cho một widget
                  // con cụ thể. (no la flex day)
                  //logo image
                  Image.asset(
                    "assets/logo_only_food.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),

                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Only Food",
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
                    hintText: 'Phone number, email or username ',
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _emailController,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  //Text field input for password
                  TextFieldInput(
                      // cai nay la widget tu customize ben kia do
                      hintText: 'Password ',
                      textInputType: TextInputType.text,
                      textEditingController: _passwordController,
                      isPass: true),
                  const SizedBox(
                    height: 24,
                  ),
                  //button login
                  InkWell(
                    onTap: _isLoading
                        ? null
                        : () => login(), // Trigger login on tap
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
                        color: buttonBlack,
                      ),
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Text("Log In"),
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  //transitioning to signing up

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: const Text(
                          "Don't have account?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: const Text(
                            "Sign up.?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
            ),
            // Positioned.fill(
            //   child: FutureBuilder<Map<String, dynamic>>(
            //     future: login(),
            //     builder: (BuildContext context,
            //         AsyncSnapshot<Map<String, dynamic>> snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         // Show a loading indicator while the API call is in progress.
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       } else if (snapshot.hasError) {
            //         // Handle error state
            //         return Center(
            //           child: Text('Error: ${snapshot.error}'),
            //         );
            //       } else if (snapshot.hasData) {
            //         // Handle successful login state
            //         Map<String, dynamic> user = snapshot.data!;
            //         // Render your UI based on the user data received from the API
            //         return const MobileScreenLayout();
            //       } else {
            //         // Handle other states if necessary
            //         return const Center(
            //           child: Text('Something went wrong'),
            //         );
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
