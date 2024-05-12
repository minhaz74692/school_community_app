import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        CollectionReference customers = firestore.collection('customers');

        // Add a document to the "customers" collection with an auto-generated ID
        await customers.add({
          'name': 'John Doe',
          'email': 'john@example.com',
          'phone': '+1234567890',
        });

        print('Customers collection created successfully.');
      } catch (e) {
        print('Error creating customers collection: $e');
      }
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sust App'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                await getUsers().then((value) => debugPrint("Success"));
              },
              child: Text("Create User")),
        ),
      ),
    );
  }
}
