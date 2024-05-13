import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sust_app/providers/tab_controller_provider.dart';

class AppConstants {
  static List<IconData> tabIconList = [
    CupertinoIcons.home,
    Icons.luggage,
    Icons.add,
    CupertinoIcons.news,
    Icons.person,
  ];
  static List<String> tabTitles = ["Home", "Jobs", "Post", "Feed", "Profile"];

  static hideNavBar(bool status, BuildContext context) {
    var tcp = context.read<TabControllerProvider>();
    Future.microtask(() => tcp.setHideNavBar(status));
  }
}
