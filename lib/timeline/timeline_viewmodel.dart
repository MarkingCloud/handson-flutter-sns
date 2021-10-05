// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 参照ファイル
import '/model/auth_model.dart';
import '/model/posts_model.dart';

final authProvider =
    Provider.autoDispose((ref) => ref.watch(authModelProvider));

final postsProvider =
    Provider.autoDispose((ref) => ref.watch(postsModelProvider));

void signIn() {
  signInAuth();
}

void signOut() {
  signOutAuth();
}
