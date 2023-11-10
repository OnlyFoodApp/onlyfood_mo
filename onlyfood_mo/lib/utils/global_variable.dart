import 'package:flutter/material.dart';
import 'package:onlyfood_mo/screens/newfeeds/newfeed_screen.dart';
import 'package:onlyfood_mo/screens/notificate/notificate_screen.dart';
import 'package:onlyfood_mo/screens/search/search_screen.dart';
import 'package:onlyfood_mo/screens/view_profile/view_profile_main.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const NewfeedScreen(),
  const SearchScreen(),
  const Text(
    'Post',
    style: TextStyle(color: Colors.black),
  ),
  const NotificateScreen(),
  const ViewProfileMain()
];
