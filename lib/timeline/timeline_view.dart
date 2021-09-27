// 依存パッケージ
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照
import '/abstract/post.dart';
import '/timeline/timeline_viewmodel.dart';

const url =
    'http://4.bp.blogspot.com/--BQnc6hxRm4/VEETLVoJiUI/AAAAAAAAoa0/GZZhRIxBwso/s800/sensu_salaryman.png';

class TimeLinePage extends HookWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override

  // Todo
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Time Line'),
      //   actions: [_userIcon(), _authButton()],
      // ),
      body: _timeLine(context),
      // floatingActionButton: _postButton(context),
    );
  }

  // appBarの要素
  Widget _userIcon() {
    final user = useProvider(authProvider);
    if (user.state == false) {
      return const Icon(Icons.account_circle);
    } else {
      return _userPhoto(url);
    }
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
    if (user.state == false) {
      return _signInButton(user);
    } else {
      return _signOutButton(user);
    }
  }

  Widget _signInButton(StateController user) {
    return IconButton(
      onPressed: () {
        signIn(user);
      },
      icon: const Icon(Icons.login),
    );
  }

  Widget _signOutButton(StateController user) {
    return IconButton(
      onPressed: () {
        signOut(user);
      },
      icon: const Icon(Icons.logout),
    );
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

  // bodyの要素
  Widget _timeLine(BuildContext context) {
    final posts = useProvider(postsProvider).state;
    return _timeLineCards(context, posts);
  }

  Widget _timeLineCards(BuildContext context, List posts) {
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
      return const Icon(Icons.account_circle);
    } else {
      return _userPhoto(post.photoURL);
    }
  }
}
