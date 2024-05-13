// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:sust_app/constants/app_constants.dart';
import 'package:sust_app/providers/tab_controller_provider.dart';
import 'package:sust_app/tabs/home_tab.dart';
import 'package:sust_app/tabs/jobs_tab.dart';
import 'package:sust_app/tabs/post_tab.dart';
import 'package:sust_app/tabs/profile_tab.dart';

class HomeScreenn extends StatelessWidget {
  const HomeScreenn({super.key});

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
        HomeTab(),
        JobsTab(),
        PostTab(),
        ProfileTab(),
        ProfileTab(),
      ];
    }

    var tcp = context.watch<TabControllerProvider>();

    bool isIos = Platform.isIOS;
    return PopScope(
      onPopInvoked: (didPop) => _onBackPressed(),
      child: PersistentTabView(
        context,
        bottomScreenMargin: 50,

        // bottomScreenMargin: !tcp.hideNavBar
        //     ? isIos
        //         ? 70
        //         : 55
        //     : 0,
        controller:
            PersistentTabController(initialIndex: tcp.navbarActiveIndex),
        onItemSelected: (value) {
          tcp.setNavIndex(value);
        },
        // navBarStyle: NavBarStyle.style12,
        navBarStyle: NavBarStyle.style3,
        padding: NavBarPadding.symmetric(horizontal: 0),
        screens: _buildScreens(),
        items: _navBarsItems(),
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

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return List.generate(
      AppConstants.tabIconList.length,
      (index) => PersistentBottomNavBarItem(
        icon: Icon(AppConstants.tabIconList[index]),
        title: (AppConstants.tabTitles[index]),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    );
    // return [
    // PersistentBottomNavBarItem(
    //   icon: Icon(CupertinoIcons.home),
    //   title: ("Home"),
    //   activeColorPrimary: CupertinoColors.activeBlue,
    //   inactiveColorPrimary: CupertinoColors.systemGrey,
    // ),
    //   PersistentBottomNavBarItem(
    //     icon: Icon(CupertinoIcons.settings),
    //     title: ("Settings"),
    //     activeColorPrimary: CupertinoColors.activeBlue,
    //     inactiveColorPrimary: CupertinoColors.systemGrey,
    //   ),
    // ];
  }

  // List<PersistentBottomNavBarItem> _navBarsItems(TabControllerProvider tcp) {
  //   return List.generate(
  //     AppConstants.tabIconList.length,
  //     (index) => PersistentBottomNavBarItem(
  //       icon: Column(
  //         children: [
  //           SizedBox(
  //             height: 26,
  //             width: 26,
  //             child: Icon(AppConstants.tabIconList[index]),
  //             // child: SvgPicture.asset(
  //             //   AppConstant.svgList[index],
  //             //   height: 26,
  //             //   width: 26,
  //             //   colorFilter: index != 0
  //             //       ? ColorFilter.mode(
  //             //           index == tcp.navbarActiveIndex
  //             //               ? AppColors.primaryColor
  //             //               : Colors.black,
  //             //           BlendMode.srcIn)
  //             //       : null,
  //             // ),
  //           ),
  //           Text(
  //             AppConstants.tabTitles[index],
  //             style: TextStyle(
  //               color:
  //                   index == tcp.navbarActiveIndex ? Colors.blue : Colors.black,
  //               fontSize: index == tcp.navbarActiveIndex ? 12 : 11,
  //               fontWeight: index == tcp.navbarActiveIndex
  //                   ? FontWeight.w500
  //                   : FontWeight.normal,
  //               decorationColor: Colors.white,
  //             ),
  //           ),
  //         ],
  //       ),
  //       activeColorPrimary: Colors.blue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //   );
  // }
}
