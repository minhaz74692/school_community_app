import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sust_app/app.dart';
import 'package:sust_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFirestore.instance.settings = Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  // FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
  runApp(
    const MyApp(),
  );
}
