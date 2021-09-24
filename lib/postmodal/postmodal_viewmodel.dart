// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 参照ファイル
import '/abstract/post.dart';
import '/model/auth_model.dart';
import '/model/posts_model.dart';

final postStateNotifierProvider = StateNotifierProvider<PostStateNotifier>(
  (ref) => PostStateNotifier(),
);

class PostStateNotifier extends StateNotifier<Post> {
  PostStateNotifier() : super(const Post());

  void changeBody(String value) {
    state = state.copyWith(body: value);
  }

  Future addPost() async {
    final user = getCurrentUser();
    if (user != null) {
      state = state.copyWith(
        user: user.displayName.toString(),
        uid: user.uid,
        photoURL: user.photoURL.toString(),
        timeStamp: DateTime.now(),
      );
    } else {
      state = state.copyWith(
        user: 'anonymous',
        uid: 'anonymous',
        timeStamp: DateTime.now(),
      );
    }
    await addPostDB(state);
  }
}
