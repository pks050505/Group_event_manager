import 'package:contribution_app/models/userModel.dart';
import 'package:contribution_app/sevices/authService.dart';

class DatabaseService {
  Future<Usermodel> userModel(String uid) async {
    try {
      final ref = userRef.doc(uid).get();
      return ref.then((value) => Usermodel.fromJson(value.data()));
    } catch (e) {
      return e;
    }
  }

  // Future<void> createUser() async {
  //   // var hasUser = _userRef.doc(user.uid).snapshots();
  //   try {
  //     print('start adding daata');
  //     if (_userRef.doc(user.uid).snapshots().isEmpty == true) {
  //       print('enter in condition');
  //       var _userdata = UserModel(
  //         accountCreated: Timestamp.now(),
  //         email: user.email,
  //         lastActivity: Timestamp.now(),
  //         name: user.displayName,
  //         uid: user.uid,
  //       );
  //       print('userModel');
  //       print(UserModel().toString());
  //       return await _userRef.doc(user.uid).set(_userdata.toMap());
  //     } else {
  //       print('not data added');
  //     }
  //   } catch (e) {}
  // }

  // Future<bool> isNewUser(User user) async {
  //   QuerySnapshot result = await FirebaseFirestore.instance
  //       .collection("users")
  //       .where("email", isEqualTo: user.email)
  //       .get();
  //   final List<DocumentSnapshot> docs = result.docs;
  //   return docs.length == 0 ? true : false;
  // }

  // Future<void> addUserToDb(User currentuser) async {
  //   var user = UserModel(
  //     uid: currentuser.uid,
  //     email: currentuser.email,
  //     name: currentuser.displayName,
  //   );
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(currentuser.uid)
  //       .set(user.toMap());
  // }

}
