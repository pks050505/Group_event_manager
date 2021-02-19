import 'package:contribution_app/route/addSingleExpence.dart';
import 'package:contribution_app/widgets/expence_item.dart';
import 'package:flutter/material.dart';
import 'package:contribution_app/providers/providers.dart';

class UserExpence extends StatelessWidget {
  static const route = '/UserExpence';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Expence'),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //         icon: Icon(Icons.add),
      //         onPressed: () {
      //           var expence = ExpenceModel((b) {
      //             return null;
      //           });
      //           context.read(addUserExpenceProvider(expence));
      //         })
      //   ],
      // ),
      body: Consumer(
        builder: (_, watch, child) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: watch(listOfUserExpenceStreamProvider).when(
              data: (val) {
                return ListView.builder(
                  itemCount: val.length ?? 0,
                  itemBuilder: (_, i) {
                    return ExpenceItem(item: val[i]);
                  },
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (e, s) => Text(e.toString()),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddSingleExpence.route);
        },
        child: Icon(Icons.add),
        tooltip: 'Add marketing stuff',
      ),
    );
  }
}
