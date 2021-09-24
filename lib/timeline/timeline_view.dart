// 依存パッケージ
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照
import '/abstract/post.dart';
import '/timeline/timeline_viewmodel.dart';

class TimeLinePage extends HookWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Line'),
        actions: [_userIcon(), _authButton()],
      ),
      body: _timeLine(context),
      floatingActionButton: _postButton(context),
    );
  }

  // appBarの要素
  Widget _userIcon() {
    final user = useProvider(authProvider);
    return user.when(
      data: (user) {
        if (user == null) {
          return _anonymousIcon();
        } else {
          return _userPhoto(user.photoURL!);
        }
      },
      loading: () => const CircularProgressIndicator(),
      error: (err, stackTrace) => Text(err.toString()),
    );
  }

  Widget _anonymousIcon() {
    return const CircleAvatar(
      backgroundImage: AssetImage('image/flutter.png'),
      backgroundColor: Colors.transparent,
      radius: 16,
    );
  }

  Widget _userPhoto(String photoURL) {
    return CircleAvatar(
      backgroundImage: NetworkImage(photoURL),
      backgroundColor: Colors.transparent,
      radius: 16,
    );
  }

  Widget _authButton() {
    final user = useProvider(authProvider);
    return user.when(
      data: (user) {
        if (user == null) {
          return _signInButton();
        } else {
          return _signOutButton();
        }
      },
      loading: () => const CircularProgressIndicator(),
      error: (err, stackTrace) => Text(err.toString()),
    );
  }

  Widget _signInButton() {
    return IconButton(
      onPressed: () {
        signIn();
      },
      icon: const Icon(Icons.login),
    );
  }

  Widget _signOutButton() {
    return IconButton(
      onPressed: () {
        signOut();
      },
      icon: const Icon(Icons.logout),
    );
  }

  // bodyの要素
  Widget _timeLine(BuildContext context) {
    final posts = useProvider(postsProvider);
    return posts.when(
      data: (posts) => _timeLineCards(context, posts.toList()),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stackTrace) => Text(err.toString()),
    );
  }

  Widget _timeLineCards(BuildContext context, List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return _postCard(posts[index]);
      },
      reverse: true,
    );
  }

  Widget _postCard(Post post) {
    return Card(
      child: ListTile(
        leading: _postIcon(post),
        title: Text(post.user),
        subtitle: Text(post.body),
        isThreeLine: true,
      ),
    );
  }

  Widget _postIcon(Post post) {
    if (post.uid == 'anonymous') {
      return _anonymousIcon();
    } else {
      return _userPhoto(post.photoURL);
    }
  }

  // floatingActionButtonの要素
  Widget _postButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/post');
      },
      child: const Icon(Icons.add),
    );
  }
}
