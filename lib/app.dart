import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sust_app/models/theme.dart';
import 'package:sust_app/providers/tab_controller_provider.dart';
import 'package:sust_app/providers/theme_bloc.dart';
import 'package:sust_app/screens/home.dart';
import 'package:sust_app/screens/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (_, mode, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<TabControllerProvider>(
                create: (context) => TabControllerProvider(),
              ),
              
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              // supportedLocales: context.supportedLocales,
              // localizationsDelegates: context.localizationDelegates,
              // navigatorObservers: [firebaseObserver],
              // locale: context.locale,
              theme: ThemeModel().lightTheme,
              darkTheme: ThemeModel().darkTheme,
              themeMode:
                  mode.darkTheme == true ? ThemeMode.dark : ThemeMode.light,
              home: const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
