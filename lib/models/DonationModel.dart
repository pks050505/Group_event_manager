import 'package:cloud_firestore/cloud_firestore.dart';

class DonationModel {
  final String title;
  final Timestamp time;

  final num givenAmount;
  DonationModel({this.title, this.givenAmount, this.time});
  factory DonationModel.fromMap(Map data) {
    return DonationModel(
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
