import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sust_app/providers/theme_bloc.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var tp = context.watch<ThemeProvider>();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            tp.toggleTheme();
          },
          child: Text(tp.darkTheme == true ? "Light Mode" : "Dart Mode"),
        ),
      ),
    );
  }
}
