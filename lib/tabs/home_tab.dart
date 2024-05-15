// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sust_app/configs/app_config.dart';
import 'package:sust_app/constants/app_constants.dart';
import 'package:sust_app/utills/custom_elevated_button.dart';
import 'package:sust_app/utills/custom_text_field.dart';
import 'package:sust_app/utills/theme/text.style.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    String? userName;

    Future<List<Map<String, dynamic>>> getUsers() async {
      List<Map<String, dynamic>> userList = [];

      try {
        // Reference to the "users" collection
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');

        // Retrieve all documents in the collection
        QuerySnapshot querySnapshot = await users.get();

        // Extract data from each document
        querySnapshot.docs.forEach((doc) {
          // userList.add(doc.data());
        });

        return userList;
      } catch (e) {
        print("Error getting users: $e");
        return userList;
      }
    }

    Future<void> createCustomersCollection() async {
      try {
        // Get a reference to the Firestore instance
        FirebaseFirestore firestore = FirebaseFirestore.instance;

        // Create a collection reference
        CollectionReference customers = firestore.collection('users');

        // Add a document to the "customers" collection with an auto-generated ID
        await customers.add({
          'name': '$userName',
          'email': 'john@example.com',
          'phone': '+1234567890',
        });

        print('Customers collection created successfully.');
      } catch (e) {
        print('Error creating customers collection: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Image.asset(
              AppConfig.appIcon,
              width: 50,
            ),
            Text(
              "SUST Community",
              style: interStyle18_600,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Colors.grey[700],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  "Shahjalal University of Science and Technology (SUST) was established in 1986. The only university of its kind at that time, it started it''s journey on the 13th of February 1991 with only three departments: Physics, Chemistry and Economics, 13 teachers and 205 students. It has now expanded to 7 schools, 27 departments , 2 institutes and and centers. The number of teachers has grown to 566 and the students to 8596. Besides, the University has 12 affiliated colleges under the School of Medical Sciences with 4000 students.",
                  style: interStyle14_400,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  createCustomersCollection()
                      .then((value) => debugPrint("succcess"));
                },
                child: Text("Click"),
              ),
              ElevatedButton(
                onPressed: () {
                  AppConstants.hideNavBar(false, context);
                },
                child: Text("Show"),
              ),
              ElevatedButton(
                onPressed: () {
                  AppConstants.hideNavBar(true, context);
                },
                child: Text("Hide"),
              ),
              CustomTextField(
                controller: nameController,
              ),
              CustomElevatedButton(
                title: "Save",
                onPressed: () {
                  setState(() {
                    userName = nameController.text.toString();
                  });
                  createCustomersCollection()
                      .then((value) => debugPrint("succcess"));
                  debugPrint(nameController.text.toString());
                },
              ),
              Container(
                height: 100,
                width: 200,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
