// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:sust_app/constants/app_constants.dart';
import 'package:sust_app/providers/tab_controller_provider.dart';
import 'package:sust_app/tabs/feed_tab.dart';
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

    List tabScreens = [
      HomeTab(),
      JobsTab(),
      PostTab(),
      FeedTab(),
      ProfileTab(),
    ];

    List<PersistentTabConfig> _navBarsItems(TabControllerProvider tcp) {
      return List.generate(
        AppConstants.tabIconList.length,
        (index) => PersistentTabConfig(
          screen: tabScreens[index],
          item: ItemConfig(
            icon: Column(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Icon(AppConstants.tabIconList[index]),
                ),
              ],
            ),
            title: AppConstants.tabTitles[index],
          ),
        ),
      );
    }

    var tcp = context.watch<TabControllerProvider>();

    return PopScope(
      onPopInvoked: (didPop) => _onBackPressed(),
      child: PersistentTabView(
        tabs: _navBarsItems(tcp),
        navBarHeight: 60,
        navBarBuilder: (navBarConfig) => Style4BottomNavBar(
          navBarConfig: navBarConfig,
        ),
        hideNavigationBar: tcp.hideNavBar,
      ),
    );
  }
}
