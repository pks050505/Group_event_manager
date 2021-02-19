import 'package:contribution_app/models/DonationModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DonationItem extends StatelessWidget {
  final DonationModel item;
  const DonationItem({@required this.item}) : assert(item != null);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.headline5,
        ),
        trailing: Text(
          '+ ${item.givenAmount}',
          textScaleFactor: 1.5,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(DateFormat.MMMEd().format(item.time.toDate())),
        
      ),
    );
  }
}
