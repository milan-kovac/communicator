import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communicator/src/models/event.dart';
import 'package:communicator/src/models/user.dart';
import 'package:communicator/src/services/file.service.dart';
import 'package:communicator/src/services/user.service.dart';
import 'package:flutter/material.dart';

class EventService {
  static Future<void> addEvent(String description, File imageFile, DateTime pickedDate, TimeOfDay pickedTime) async {
    try {
      UserModel user = await UserService.getLocalUser();
      String imageUrl = await FileService.uploadFile(imageFile);

      // format DateTime
      pickedDate
        ..subtract(Duration(hours: pickedDate.hour, minutes: pickedDate.minute))
        ..add(Duration(hours: pickedTime.hour, minutes: pickedTime.minute));
  
      CollectionReference<Map<String, dynamic>> events = FirebaseFirestore.instance.collection('events');
      await events.add({'description': description, 'image': imageUrl, 'date': pickedDate, 'sound': '', 'user': user.id});
      
    } catch (error) {
      log('addEvent: $error');
      rethrow;
    }
  }

  static Stream<List<EventModel>> getEvents() async* {
    try {
      UserModel user = await UserService.getLocalUser();
      yield* FirebaseFirestore.instance
          .collection('events')
          .where("user", isEqualTo: user.id)
          .snapshots()
          .map((snapshot) => EventModel.fromListDynamic(snapshot.docs));
    } catch (error) {
      log('getEvents: $error');
      rethrow;
    }
  }
}
