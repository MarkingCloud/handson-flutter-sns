// 依存パッケージ
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authModelProvider = StreamProvider.autoDispose((ref) {
  //return FirebaseAuth.instance.authStateChanges();
  return Stream<User?>.value(null);
});

void signInAuth() {
  // GoogleAuthProvider googleProvider = GoogleAuthProvider();
  // FirebaseAuth.instance.signInWithPopup(googleProvider);
}

void signOutAuth() {
  // FirebaseAuth.instance.signOut();
}

User? getCurrentUser() {
  // final user = FirebaseAuth.instance.currentUser;
  // if (user != null) {
  //   return user;
  // } else {
  //   return null;
  // }
  return null;
}
