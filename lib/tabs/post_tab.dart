import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sust_app/services/firebase_services.dart';
import 'package:sust_app/utills/custom_elevated_button.dart';

class PostTab extends StatelessWidget {
  const PostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {},
        ),
      ),
      body: Center(
        child: CustomElevatedButton(
          title: "Add",
          onPressed: () {
            FirebaseServices.addUserEmail('zawad123@gmail.com');
          },
        ),
      ),
    );
  }
}
