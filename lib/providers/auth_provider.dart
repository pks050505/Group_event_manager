import 'package:contribution_app/providers/providers.dart';
import 'package:contribution_app/sevices/authService.dart';
import 'package:firebase_auth/firebase_auth.dart';

//FirebaseAuth.instance provider Like a singleTon pattern
final firbaseAuthInstance = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});
//s
final authClassProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(firbaseAuthInstance));
});
final authStreamProvider = StreamProvider<User>((ref) {
  return ref.watch(authClassProvider).onAuthStateChanges;
});

final userProvider = StateProvider<User>((ref) {
  final user = ref.watch(authStreamProvider).data?.value;
  return user;
});
final uidProvider = StateProvider<String>((ref) {
  final uid = ref.watch(userProvider).state.uid;
  return uid;
});
