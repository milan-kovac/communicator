import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communicator/src/models/user.dart';
import 'package:communicator/src/services/file.service.dart';
import 'package:communicator/src/services/user.service.dart';
import 'package:flutter/material.dart';

class EventService {
  static Future<void> addEvent(String description, File imageFile, DateTime pickedDate, TimeOfDay pickedTime) async {
    try {
      UserModel user = await UserService.getLocalUser();
      String imageUrl = await FileService.uploadFile(imageFile);
      DateTime date = pickedDate.add(Duration(hours: pickedTime.hour, minutes: pickedTime.minute));
      CollectionReference<Map<String, dynamic>> events = FirebaseFirestore.instance.collection('events');
      await events.add({'description': description, 'image': imageUrl, 'date': date, 'sound': '', 'user': user.id});
    } catch (error) {
      log('addEvent: $error');
      rethrow;
    }
  }
}
