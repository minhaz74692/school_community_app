import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sust_app/constants/app_constants.dart';
import 'package:sust_app/utills/custom_elevated_button.dart';
import 'package:sust_app/utills/custom_text_field.dart';

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
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
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
    );
  }
}
