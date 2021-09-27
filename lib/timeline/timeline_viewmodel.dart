// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 参照ファイル
import '/model/posts_model.dart';

final authProvider = StateProvider((ref) => false);

final postsProvider =
    Provider.autoDispose((ref) => ref.watch(postsModelProvider));

Future signIn(StateController user) async {
  user.state = true;
}

Future signOut(StateController user) async {
  user.state = false;
}
