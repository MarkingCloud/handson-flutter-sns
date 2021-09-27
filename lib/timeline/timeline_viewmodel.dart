// 依存パッケージ
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 参照ファイル
import '/abstract/post.dart';
import '/model/posts_model.dart';

final authProvider = StateProvider((ref) => false);

// final postsProvider =
//     Provider.autoDispose((ref) => ref.watch(postsModelProvider));

final postsProvider = StateProvider(
  (ref) => [
    Post(
      user: 'anonymous',
      body: 'body1',
      uid: 'anonymous',
      photoURL: '',
      timeStamp: DateTime(2021),
    ),
    Post(
      user: 'anonymous',
      body: 'body2',
      uid: 'anonymous',
      photoURL: '',
      timeStamp: DateTime(2021),
    ),
    Post(
      user: 'anonymous',
      body: 'body3',
      uid: 'anonymous',
      photoURL: '',
      timeStamp: DateTime(2021),
    ),
  ],
);

Future signIn(StateController user) async {
  user.state = true;
}

Future signOut(StateController user) async {
  user.state = false;
}
