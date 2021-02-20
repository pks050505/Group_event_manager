import 'package:contribution_app/route/addSingleExpence.dart';
import 'package:contribution_app/shared/widgets.dart';
import 'package:contribution_app/widgets/expence_item.dart';
import 'package:flutter/material.dart';
import 'package:contribution_app/providers/providers.dart';
import 'package:velocity_x/velocity_x.dart';

class UserExpence extends StatelessWidget {
  static const route = '/UserExpence';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PreferredSize(
              child: 'All Expences'
                  .text
                  .bold
                  .center
                  .make()
                  .box
                  .color(Vx.blue500)
                  .make(),
              preferredSize: Size.fromHeight(100)),
          _UserExpence(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: bottomNavigation('add expence', () {
        Navigator.pushNamed(context, AddSingleExpence.route);
      }),
    );
  }
}

class _UserExpence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, child) {
        return Container(
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
    );
  }
}
