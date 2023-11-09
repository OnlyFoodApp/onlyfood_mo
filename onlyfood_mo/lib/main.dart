import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onlyfood_mo/responsive/mobile_screen_layout.dart';
import 'package:onlyfood_mo/responsive/responsive_layout_screen.dart';
import 'package:onlyfood_mo/responsive/web_screen_layout.dart';
import 'package:onlyfood_mo/screens/campaign/add_new_campaign.dart';
import 'package:onlyfood_mo/screens/campaign/add_menu_for_campaign.dart';
import 'package:onlyfood_mo/screens/cart/view_my_cart.dart';
import 'package:onlyfood_mo/screens/comment/comment_screen.dart';
import 'package:onlyfood_mo/screens/create_post/create_post_screen.dart';

import 'package:onlyfood_mo/screens/login/login_screen.dart';

import 'package:onlyfood_mo/screens/newfeeds/newfeed_screen.dart';
import 'package:onlyfood_mo/screens/notificate/notificate_screen.dart';

import 'package:onlyfood_mo/screens/post/view_post_detail.dart';

import 'package:onlyfood_mo/screens/profile_editing/profile_editing.dart';
import 'package:onlyfood_mo/screens/reset_password/reset_password.dart';
import 'package:onlyfood_mo/screens/reset_password/reset_password_verify.dart';
import 'package:onlyfood_mo/screens/reset_password/reset_pasword_second.dart';
import 'package:onlyfood_mo/screens/search/search_screen.dart';
import 'package:onlyfood_mo/screens/signup/signup_screen.dart';
import 'package:onlyfood_mo/screens/signup/signup_screen_fourth.dart';
import 'package:onlyfood_mo/screens/signup/signup_screen_second.dart';
import 'package:onlyfood_mo/screens/signup/signup_screen_third.dart';
import 'package:onlyfood_mo/screens/view_campaign_detail-chef/view_campaign_detail_chef.dart';
import 'package:onlyfood_mo/screens/view_profile/view_profile_main.dart';
import 'package:onlyfood_mo/screens/view_profile/profile.dart';
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
        home: LoginScreen());
  }
}
