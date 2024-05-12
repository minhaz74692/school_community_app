import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        CollectionReference customers = firestore.collection('customer');

        // Add a document to the "customers" collection with an auto-generated ID
        await customers.add({
          'name': 'Minhazul Islam Emon',
          'email': 'john@example.com',
          'phone': '+1234567890',
        });

        print('Customers collection created successfully.');
      } catch (e) {
        print('Error creating customers collection: $e');
      }
    }

    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              createCustomersCollection()
                  .then((value) => debugPrint("succcess"));
            },
            child: Text("Click")),
      ),
    );
  }
}
