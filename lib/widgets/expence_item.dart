import 'package:contribution_app/models/expenceModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenceItem extends StatelessWidget {
  final ExpenceModel item;
  const ExpenceItem({@required this.item}) : assert(item != null);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.title),
        subtitle: Text(DateFormat.MMMEd().format(item.time.toDate())),
        trailing: Text(
          '- ${item.givenAmount}',
          textScaleFactor: 1.5,
          style: TextStyle(color: Colors.redAccent[200]),
        ),
        // subtitle: Text(
        //   DateFormat.MMMEd().format(item.time.toDate()),
        // : Text(
        //   DateFormat.MMMEd().format(item.time.toDate()),
        //   style: TextStyle(color: Colors.redAccent),
        // ),
      ),
    );
  }
}
