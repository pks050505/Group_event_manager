import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:meta/meta.dart';

class Project {
  String id;
  final String title;
  final String owner;
  final Timestamp createdTime;
  // List<String> admins;
  Project({this.owner, this.createdTime, this.id, @required this.title}) {
    this.id = id ?? Uuid().v4();
  }

  Project copyWith(
      {String createdBy, Timestamp createdTime, String id, String title}) {
    return Project(
      // admins: admins ?? this.admins,
      owner: createdBy ?? this.owner,

      createdTime: createdTime ?? this.createdTime,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  factory Project.fromMap(Map data) {
    return Project(
      title: data['title'] ?? 'null',
      id: data['id'] ?? '',

      owner: data['owner'] ?? 'null',
      createdTime: data['createdTime'],
      // admins: (data['admins'] as List ?? []),
    );
  }
  Map<String, dynamic> toMap() {
    DateTime currentPhoneDate = DateTime.now(); //DateTime
    Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate);
    return {
      'title': this.title,
      'id': this.id,
      'owner': this.owner,
      'createdTime': myTimeStamp,
      // 'admins': this.admins,
    };
  }
}
