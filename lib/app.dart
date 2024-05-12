// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:sust_app/constants/app_constants.dart';
import 'package:sust_app/providers/tab_controller_provider.dart';
import 'package:sust_app/tabs/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    _onBackPressed() async {
      if (context.read<TabControllerProvider>().currentIndex != 0) {
        context.read<TabControllerProvider>().controlTab(0);
      } else {
        await SystemChannels.platform
            .invokeMethod<void>('SystemNavigator.pop', true);
      }
    }

    List<Widget> _buildScreens() {
      return [
        HomeScreen(),
        HomeScreen(),
        HomeScreen(),
        HomeScreen(),
      ];
    }

    var tcp = context.watch<TabControllerProvider>();

    bool isIos = Platform.isIOS;
    return PopScope(
      onPopInvoked: (didPop) => _onBackPressed(),
      child: PersistentTabView(
        context,
        bottomScreenMargin: 0,
        // bottomScreenMargin: !tcp.hideNavBar
        //     ? isIos
        //         ? 70
        //         : 55
        //     : 0,
        controller:
            PersistentTabController(initialIndex: tcp.navbarActiveIndex),
        onItemSelected: (value) {
          tcp.setNavIndex(value);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (BuildContext context) => HomeScreen(
          //       fromAddress: hp.fromAddress,
          //     ),
          //   ),
          // );
        },
        navBarStyle: NavBarStyle.style12,
        padding: NavBarPadding.symmetric(horizontal: 0),
        screens: _buildScreens(),
        items: _navBarsItems(tcp),
        navBarHeight: isIos ? 70 : 55,
        confineInSafeArea: false,

        backgroundColor: Colors.white, // Customize the background color
        handleAndroidBackButtonPress:
            true, // Handle the Android back button press
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        hideNavigationBar: tcp.hideNavBar,
        decoration: NavBarDecoration(
          // adjustScreenBottomPaddingOnCurve: false,

          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: .1,
              blurRadius: .1,
            ),
          ],
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 500),
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems(TabControllerProvider tcp) {
    return List.generate(
      AppConstants.tabIconList.length,
      (index) => PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SizedBox(
              height: 26,
              width: 26,
              child: Icon(AppConstants.tabIconList[index]),
              // child: SvgPicture.asset(
              //   AppConstant.svgList[index],
              //   height: 26,
              //   width: 26,
              //   colorFilter: index != 0
              //       ? ColorFilter.mode(
              //           index == tcp.navbarActiveIndex
              //               ? AppColors.primaryColor
              //               : Colors.black,
              //           BlendMode.srcIn)
              //       : null,
              // ),
            ),
            Text(
              AppConstants.tabTitles[index],
              style: TextStyle(
                color:
                    index == tcp.navbarActiveIndex ? Colors.blue : Colors.black,
                fontSize: index == tcp.navbarActiveIndex ? 12 : 11,
                fontWeight: index == tcp.navbarActiveIndex
                    ? FontWeight.w500
                    : FontWeight.normal,
                decorationColor: Colors.white,
              ),
            ),
          ],
        ),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    );
  }
}
