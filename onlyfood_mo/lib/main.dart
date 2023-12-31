import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:onlyfood_mo/screens/login/login_screen.dart';



import 'package:onlyfood_mo/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyC-60ZsWZT_eQIa-hcuzlHxEGpFep7sEk4',
            appId: '1:60089411770:web:281a050b621f2c18777a83',
            messagingSenderId: '60089411770',
            projectId: 'only-food-ce886',
            storageBucket:
                'only-food-ce886.appspot.com')); //khởi tạo Firebase trong ứng dụng
  } else {
    // await Firebase.initializeApp(); //khởi tạo Firebase trong ứng dụng
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Only Food',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: const LoginScreen());
  }
}
