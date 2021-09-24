// 依存パッケージ
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authModelProvider = StreamProvider.autoDispose((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

Future signInAuth() async {
  GoogleAuthProvider googleProvider = GoogleAuthProvider();
  return await FirebaseAuth.instance.signInWithPopup(googleProvider);
}

Future signOutAuth() async {
  return await FirebaseAuth.instance.signOut();
}

User? getCurrentUser() {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return user;
  } else {
    return null;
  }
}
