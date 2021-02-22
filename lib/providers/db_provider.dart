import 'dart:ffi';

import 'package:contribution_app/models/models.dart';

import 'package:contribution_app/models/userModel.dart';
import 'package:contribution_app/providers/providers.dart';
import 'package:contribution_app/sevices/authService.dart';
import 'package:contribution_app/sevices/db.dart';

final userModelFutureProvider = FutureProvider<Usermodel>((ref) {
  final database = ref.watch(databaseServiceProvider);
  return database.userModel(ref.watch(uidProvider).state);
});
final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return DatabaseService();
});
final projectIdPro = StateProvider<String>((ref) {
  return null;
});
final deleteProjectFutureProvider = FutureProvider<String>((ref) {
  return userRef
      .doc(ref.watch(uidProvider).state)
      .collection('myProject')
      .doc(ref.watch(projectIdPro).state)
      .delete()
      .catchError(() => 'Something went wrong...')
      .then((value) => 'Deleted');
});
final addAllCollectionMoneyProvider = FutureProvider((ref) async {
  var data = await userRef
      .doc(ref.watch(uidProvider).state)
      .collection('myProject')
      .doc(ref.watch(projectIdPro).state)
      .collection('UserDonation')
      .get();
  num sum = data.docs.fold(
    0,
    (p, e) => p + num.parse(e['givenAmount']),
  );
  return sum;
});
final projectIdProvider = StateProvider<String>((ref) {
  return null;
});
final addPrivateProjectProvider =
    Provider.family.autoDispose<void, Project>((ref, project) {
  return userRef
      .doc(ref.watch(uidProvider).state)
      .collection('myProject')
      .doc(project.id)
      .set(project.toMap());
});

final addPublicProjectProvider =
    Provider.family.autoDispose<void, Project>((ref, project) {
  return userRef
      .doc()
      .collection('myProject')
      .doc(project.id)
      .set(project.toMap());
});

//ToDo
final addUserDonationProvider =
    Provider.family.autoDispose<void, DonationModel>((ref, donation) {
  String projectId = ref.watch(projectIdPro).state;
  return userRef
      .doc(ref.watch(uidProvider).state)
      .collection('myProject')
      .doc(projectId)
      .collection('UserDonation')
      .doc()
      .set(donation.toMap());
});

final addUserExpenceProvider =
    Provider.family.autoDispose<void, ExpenceModel>((ref, expence) {
  String projectId = ref.watch(projectIdPro).state;
  return userRef
      .doc(ref.watch(uidProvider).state)
      .collection('myProject')
      .doc(projectId)
      .collection('UserExpence')
      .doc()
      .set(expence.toMap());
});
final listOfUserDonationStreamProvider =
    StreamProvider<List<DonationModel>>((ref) {
  return userRef
      .doc(ref.watch(uidProvider).state)
      .collection('myProject')
      .doc(ref.watch(projectIdPro).state)
      .collection('UserDonation')
      .snapshots()
      .map(
        (event) => event.docs
            .map(
              (e) => DonationModel.fromMap(e.data()),
            )
            .toList(),
      );
});
final listOfUserExpenceStreamProvider =
    StreamProvider<List<ExpenceModel>>((ref) {
  return userRef
      .doc(ref.watch(uidProvider).state)
      .collection('myProject')
      .doc(ref.watch(projectIdPro).state)
      .collection('UserExpence')
      .snapshots()
      .map(
        (event) => event.docs
            .map(
              (e) => ExpenceModel.fromMap(e.data()),
            )
            .toList(),
      );
});
final listOfProjectStreamProvider = StreamProvider<List<Project>>((ref) {
  return userRef
      .doc(ref.watch(uidProvider).state)
      .collection('myProject')
      .snapshots()
      .map(
        (event) => event.docs
            .map(
              (doc) => Project.fromMap(doc.data()),
            )
            .toList(),
      );
});
