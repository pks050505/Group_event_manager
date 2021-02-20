import 'dart:async';
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contribution_app/models/userModel.dart';
import 'package:contribution_app/providers/providers.dart';
import 'package:contribution_app/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn signIn = GoogleSignIn();
final CollectionReference userRef =
    FirebaseFirestore.instance.collection('users');

class AuthService {
  final FirebaseAuth firebaseAuth;
  AuthService(this.firebaseAuth);
  // DatabaseService databaseService;

  Stream<User> get onAuthStateChanges => firebaseAuth.authStateChanges();

  Future<void> login(String email, String password) {
    try {
      return firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future googleSignIn() async {
    try {
      GoogleSignInAccount account = await signIn.signIn();
      if (account != null) {
        GoogleSignInAuthentication authentication =
            await account.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken,
        );
        String uid =
            (await firebaseAuth.signInWithCredential(credential)).user.uid;
        await saveUserInfoTofirestore(uid);
      }
    } catch (e) {}
  }

  // final uidStateProvider = StateProvider<String>((ref) {
  //   return null;
  // });
  // void uid(BuildContext context, String uid) {
  //   context.read(uidStateProvider).state = uid;
  // }

  saveUserInfoTofirestore(String uid) async {
    GoogleSignInAccount account = signIn.currentUser;

    DocumentSnapshot snapshot = await userRef.doc(uid).get();

    if (!snapshot.exists) {
      var userModel = Usermodel((b) => b
        ..email = account.email
        ..photoUrl = account.photoUrl
        ..uid = uid
        ..name = account.displayName);

      await userRef.doc(uid).set(userModel.toJson());
    } else {}
  }

  Future logOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {}
  }
}
