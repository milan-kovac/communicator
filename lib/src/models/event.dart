import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String user;
  final DateTime date;
  final String description;
  final String image;
  final String audio;
  final String status;

  EventModel(
      {required this.id,
      required this.user,
      required this.date,
      required this.description,
      required this.image,
      required this.audio,
      required this.status});

  // #Convert Event object to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'user': user, 'year': date, 'description': description, 'image': image, 'audio': audio, 'status': status};
  }

// #Convert JSON to Event object
  EventModel.fromJson(Map<String, dynamic> json, {id})
      : id = id ?? json['id'],
        user = json['user'],
        date = json['date'].toDate(),
        description = json['description'],
        image = json['image'],
        status = json['status'],
        audio = json['audio'];

  // #Convert ist<QueryDocumentSnapshot<Map<String, dynamic>>> to List<EventModel>
  static List<EventModel> fromListDynamic(List<QueryDocumentSnapshot<Map<String, dynamic>>> items) {
    List<EventModel> events = [];
    for (var item in items) {
      events.add(EventModel.fromJson(item.data(), id: item.id));
    }
    return events;
  }

  static String getFormatedStringTime(DateTime date) {
    var minute = date.minute < 10 ? '0${date.minute}' : date.minute.toString();
    var hour = date.hour < 10 ? '0${date.hour}' : date.hour.toString();
    return '$hour:$minute  ';
  }
}
