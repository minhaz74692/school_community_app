import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  static Future<bool> addUserEmail(String emailId) async {
    try {
      // Get a reference to the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Create a collection reference
      CollectionReference customers = firestore.collection('user-access');

      // Add a document to the "customers" collection with an auto-generated ID
      await customers.add({
        'email-id': emailId,
      });

      debugPrint('User Access collection created successfully.');
      return true;
    } catch (e) {
      debugPrint('Error creating customers collection: $e');
      return false;
    }
  }
}
