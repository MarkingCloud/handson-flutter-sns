// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 参照ファイル
import '/abstract/post.dart';
import '/timeline/timeline_viewmodel.dart';

const url =
    'http://4.bp.blogspot.com/--BQnc6hxRm4/VEETLVoJiUI/AAAAAAAAoa0/GZZhRIxBwso/s800/sensu_salaryman.png';

final postStateNotifierProvider =
    StateNotifierProvider<PostStateNotifier>((ref) {
  final user = ref.watch(authProvider);
  final posts = ref.watch(postsProvider);
  return PostStateNotifier(user, posts);
});

class PostStateNotifier extends StateNotifier<Post> {
  PostStateNotifier(this.user, this.posts) : super(const Post());
  final StateController<bool> user;
  final StateController<List> posts;

  // Todo
  void changeBody(String value) {
    // state = state.copyWith(body: value);
  }

  //Todo
  void addPost() {
    // if (user.state == true) {
    //   state = state.copyWith(
    //     user: "おじ",
    //     uid: "oji",
    //     photoURL: url,
    //     timeStamp: DateTime.now(),
    //   );
    // } else {
    //   state = state.copyWith(
    //     user: 'anonymous',
    //     uid: 'anonymous',
    //     timeStamp: DateTime.now(),
    //   );
    // }
    // final newPosts = [...posts.state];
    // newPosts.add(state);
    // posts.state = newPosts;
  }
}
