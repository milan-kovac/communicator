import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String user;
  final Timestamp date;
  final String description;
  final String image;
  final String sound;

  EventModel(
      {required this.id,
      required this.user,
      required this.date,
      required this.description,
      required this.image,
      required this.sound});


    // #Convert Event object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'year': date,
      'description': description,
      'image': image,
      'sound': sound,
    };
  }

// #Convert JSON to Event object
  EventModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        user = json['user'],
        date = json['date'],
        description = json['description'],
        image = json['image'],
        sound = json['sound'];
}
