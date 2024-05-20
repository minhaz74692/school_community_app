// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:sust_app/screens/helper.dart';
import 'package:sust_app/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String profileImage = "";
  bool connection = false;
  bool _isDisposed = false; // Add this flag

  @override
  void dispose() {
    _isDisposed = true; // Set the flag to true when disposing the widget
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                child: Hero(
                  tag: "appIcon",
                  child: Image.asset(
                    "assets/images/icon.png",
                    height: 212,
                    width: 212,
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
            const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
                strokeWidth: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigate() async {
    // bool result = await InternetConnectionChecker().hasConnection;

    // if (result == true) {
    Future.delayed(const Duration(seconds: 3), () async {
      if (!_isDisposed) {
        Helper.nextScreenCloseOthers(
          context,
          HomeScreenn(),
        );
      }
    });
    // } else {
    //   Helper.toScreen(context, const NoInternetScreen());

    //   Future.delayed(const Duration(seconds: 5), () {
    //     if (!_isDisposed) {
    //       if (Provider.of<AuthProvider>(context, listen: false)
    //           .getUserToken()
    //           .isEmpty) {
    //         Navigator.pushAndRemoveUntil(
    //           context,
    //           MaterialPageRoute(builder: (_) => const LoginScreen()),
    //           (route) => false,
    //         );
    //       } else {
    //         if (!_isDisposed) {
    //           Navigator.pushAndRemoveUntil(
    //             context,
    //             MaterialPageRoute(builder: (_) => const DashboardScreen()),
    //             (route) => false,
    //           );
    //         }
    //       }
    //     }
    //   });
    // }
  }
}
