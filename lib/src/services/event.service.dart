import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communicator/src/models/event.dart';
import 'package:communicator/src/models/user.dart';
import 'package:communicator/src/services/file.service.dart';
import 'package:communicator/src/services/user.service.dart';
import 'package:flutter/material.dart';

class EventService {
  static Future<void> addEvent(String description, File imageFile,
      DateTime pickedDate, TimeOfDay pickedTime, dynamic audioFile) async {
    try {
      UserModel user = await UserService.getLocalUser();
      String imageUrl = await FileService.uploadFile(imageFile);
      String audioUrl =
          audioFile is File ? await FileService.uploadFile(audioFile) : '';
      DateTime date = DateTime(pickedDate.year, pickedDate.month,
          pickedDate.day, pickedTime.hour, pickedTime.minute);

      CollectionReference<Map<String, dynamic>> events =
          FirebaseFirestore.instance.collection('events');
      await events.add({
        'description': description,
        'image': imageUrl,
        'date': date,
        'audio': audioUrl,
        'user': user.id,
        'status': 'inProgress'
      });
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
          .orderBy('date')
          .snapshots()
          .map((snapshot) => EventModel.fromListDynamic(snapshot.docs));
    } catch (error) {
      log('getEvents: $error');
      rethrow;
    }
  }

  static Future deletEvent(eventId) async {
    try {
      FirebaseFirestore.instance.collection('events').doc(eventId).delete();
    } catch (error) {
      log('getEvents: $error');
      rethrow;
    }
  }
}
