import 'package:contribution_app/providers/providers.dart';
import 'package:contribution_app/screens/screens.dart';
import 'package:contribution_app/shared/widgets.dart';
import 'package:contribution_app/widgets/donation_item.dart';
import 'package:flutter/material.dart';

final isLengthZeroBoolStateProvider = StateProvider<bool>((ref) {
  return true;
});

class UserDonation extends ConsumerWidget {
  static const route = '/userDonation';
  const UserDonation({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      body: Container(
        child: watch(listOfUserDonationStreamProvider).when(
          data: (val) {
            return ListView.builder(
              itemCount: val.length ?? 0,
              itemBuilder: (_, i) => DonationItem(item: val[i]),
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, s) => Text(e.toString()),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: bottomNavigation('add new member', () {
        Navigator.pushNamed(context, AddSingleDonation.route);
      }),
    );
  }
}
