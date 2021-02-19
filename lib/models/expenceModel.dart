import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenceModel {
  final String title;
  final Timestamp time;

  final num givenAmount;
  ExpenceModel({this.title, this.givenAmount, this.time});
  factory ExpenceModel.fromMap(Map data) {
    return ExpenceModel(
      title: data['title'] ?? 'null',
      time: data['time'],
      givenAmount: data['givenAmount'],
    );
  }
  Map<String, dynamic> toMap() {
    DateTime currentPhoneDate = DateTime.now(); //DateTime
    Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate);
    return {
      'title': this.title,
      'time': myTimeStamp,
      'givenAmount': this.givenAmount,
    };
  }
}

// Map<String, dynamic> toMap() {
//   DateTime currentPhoneDate = DateTime.now(); //DateTime
//   Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate);
//   return {
//     'title': this.title,
//     'id': this.id,
//     'owner': this.owner,
//     'createdTime': myTimeStamp,
//     // 'admins': this.admins,
//   };
// }
