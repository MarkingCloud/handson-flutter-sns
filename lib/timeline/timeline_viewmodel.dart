// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 参照ファイル
import '/abstract/post.dart';

// Todo
final postsProvider = StateProvider(
  (ref) => [
    // Post(
    //   user: 'anonymous',
    //   body: 'body1',
    //   uid: 'anonymous',
    //   photoURL: '',
    //   timeStamp: DateTime(2021),
    // ),
    // Post(
    //   user: 'anonymous',
    //   body: 'body2',
    //   uid: 'anonymous',
    //   photoURL: '',
    //   timeStamp: DateTime(2021),
    // ),
    // Post(
    //   user: 'anonymous',
    //   body: 'body3',
    //   uid: 'anonymous',
    //   photoURL: '',
    //   timeStamp: DateTime(2021),
    // ),
  ],
);

final authProvider = StateProvider((ref) => false);

// Todo
void signIn(StateController user) {
  // user.state = true;
}

void signOut(StateController user) {
  // user.state = false;
}
