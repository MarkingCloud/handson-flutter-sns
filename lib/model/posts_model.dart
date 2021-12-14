// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// 参照ファイル
import '/abstract/post.dart';

final postsModelProvider = StreamProvider.autoDispose((ref) {
  final posts = FirebaseFirestore.instance
      .collection('posts')
      .orderBy('timeStamp')
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map(
          (doc) => Post.fromJson(doc.data()),
        ),
      );
  return posts;
});

Future addPostDB(Post post) async {
  await FirebaseFirestore.instance.collection('posts').add(post.toJson());
}
