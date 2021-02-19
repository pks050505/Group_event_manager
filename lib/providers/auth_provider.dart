import 'package:contribution_app/providers/providers.dart';
import 'package:contribution_app/sevices/authService.dart';
import 'package:firebase_auth/firebase_auth.dart';

//FirebaseAuth.instance provider Like a singleTon pattern
final firbaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});
//s
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(firbaseAuthProvider));
});
final authStateProvider = StreamProvider<User>((ref) {
  return ref.watch(authServiceProvider).onAuthStateChanges;
});

final userProvider = StateProvider<User>((ref) {
  final user = ref.watch(authStateProvider).data?.value;
  return user;
});
final uidProvider = StateProvider<String>((ref) {
  final uid = ref.watch(userProvider).state.uid;
  return uid;
});
