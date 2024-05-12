import 'package:flutter/material.dart';

class TabControllerProvider extends ChangeNotifier {
  int _currectIndex = 0;
  int get currentIndex => _currectIndex;
  PageController? pageController;
  PageController pageControllerSet(int? index) {
    pageController = PageController(initialPage: index ?? 0);
    notifyListeners();
    return PageController(initialPage: index ?? 0);
  }

  bool _isDisposed = false;
  bool get isDisposed => _isDisposed;
  setDisposeStatus(bool status) {
    _isDisposed = status;
    notifyListeners();
  }

  controlTab(int newIndex) {
    _currectIndex = newIndex;
    // pageController.animateToPage(newIndex,
    //     duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    pageController!.jumpToPage(newIndex);

    notifyListeners();
  }

  setDispose() {
    pageController?.dispose();
    notifyListeners();
  }

  int _loginTabIndex = 0;
  int get loginTabIndex => _loginTabIndex;

  loginTabControl(int newIndex) {
    _loginTabIndex = newIndex;
    notifyListeners();
  }

  //Animated Loading Button Provider
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;
  setSuccess(bool status) {
    _isSuccess = status;
    notifyListeners();
  }

  //States for Persistant Bottom Navigation Bar
  int _navbarActiveIndex = 0;
  int get navbarActiveIndex => _navbarActiveIndex;
  setNavIndex(int index) {
    _navbarActiveIndex = index;
    debugPrint('index: $index');
    notifyListeners();
  }

  bool _hideNavBar = false;
  bool get hideNavBar => _hideNavBar;
  bool _confineSafeArea = true;
  bool get confineSafeArea => _confineSafeArea;
  setHideNavBar(bool status) {
    _hideNavBar = status;

    setConfineSafeArea(status);
    debugPrint('index: $status');
    notifyListeners();
  }

  setConfineSafeArea(bool status) async {
    if (status) {
      _confineSafeArea = false;
    } else {
      _confineSafeArea = true;
      // Future.delayed(Duration(milliseconds: 500))
      //     .then((value) => _confineSafeArea = true);
    }
    notifyListeners();
  }
}
