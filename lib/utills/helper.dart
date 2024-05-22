import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as bs;

showLog(message) {
  log("APP SAYS: $message");
}

class Helper {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static toScreen(context, screen) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => screen));
  }

  static void nextScreenCloseOthersAnimation(context, page) {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
        ((route) => false));
  }

  static List<BoxShadow> softUiShadow = [
    const BoxShadow(
      color: Colors.white,
      offset: Offset(-5, -5),
      spreadRadius: 1,
      blurRadius: 15,
    ),
    BoxShadow(
      color: const Color(0XFF748CAC).withOpacity(.6),
      offset: const Offset(5, 5),
      spreadRadius: 1,
      blurRadius: 15,
    ),
  ];

  static back(context) {
    Navigator.pop(context);
  }

//  static void nextScreenCloseOthers(context, page) {
//   Navigator.pushAndRemoveUntil(
//       context, MaterialPageRoute(builder: (context) => page), (route) => false);
// }

  static void nextScreenCloseOthers(context, page) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  static boxDecoration(Color color, double radius) {
    BoxDecoration(
        color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  static void nextScreeniOS(context, page) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
  }

  static void openBottomSheet(
      {required BuildContext context,
      required page,
      bool? isDismissible,
      bool? isDragable}) {
    // AppConstant.hideNavBar(true, context);
    showModalBottomSheet(
      isDismissible: isDismissible ?? true,
      enableDrag: isDragable ?? false,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.50,
        maxHeight: MediaQuery.of(context).size.height * .93,
      ),
      context: context,
      builder: (context) => page,
    );
  }

  static void customBottomDialog(
      {required BuildContext context,
      num? heightRatio,
      required Widget child}) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.5,
        maxHeight: heightRatio != null
            ? MediaQuery.of(context).size.height * heightRatio
            : MediaQuery.of(context).size.height * 0.95,
      ),
      builder: (BuildContext context) => child,
    );
  }

  static void openCupertinoModalBottomSheet(
      BuildContext context, Widget page, Color? barrierColor) {
    // void _showModalBottomSheet(BuildContext context) {
    bs.showCupertinoModalBottomSheet(
      // overlayStyle:
      // SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      // barrierColor: barrierColor ?? Colors.transparent,
      enableDrag: false,
      isDismissible: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // barrierColor: Colors.red,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(20),
      // ),
      context: context,
      builder: (context) {
        return page;
      },
    );
    // }
  }
}
