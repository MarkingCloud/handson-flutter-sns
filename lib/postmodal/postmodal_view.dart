// 依存パッケージ
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/postmodal/postmodal_viewmodel.dart';

class PostModalPage extends HookWidget {
  const PostModalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Modal'),
      ),
      body: _postModal(context),
    );
  }

  // bodyの要素
  Widget _postModal(BuildContext context) {
    final postStateNotifier = useProvider(postStateNotifierProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _bodyForm(context, postStateNotifier),
        _postButton(context, postStateNotifier),
      ],
    );
  }

  Widget _bodyForm(BuildContext context, PostStateNotifier postStateNotifier) {
    final screenMaxHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenMaxHeight * 0.6,
      margin: EdgeInsets.all(screenMaxHeight * 0.1),
      child: TextFormField(
        maxLines: 100,
        onChanged: postStateNotifier.changeBody,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _postButton(
      BuildContext context, PostStateNotifier postStateNotifier) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          final post = postStateNotifier.addPost();
          Navigator.of(context).pop(post);
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(20),
          ),
        ),
        child: const Text('投稿'),
      ),
    );
  }
}
