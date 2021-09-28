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
    final wordCount = useProvider(postStateNotifierProvider.state).body.length;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(wordCount.toString()),
        _bodyForm(context),
        _postButton(context),
      ],
    );
  }

  Widget _bodyForm(BuildContext context) {
    final screenMaxHeight = MediaQuery.of(context).size.height;
    final postStateNotifier = useProvider(postStateNotifierProvider);
    return Container(
      height: screenMaxHeight * 0.5,
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

  Widget _postButton(BuildContext context) {
    final postStateNotifier = useProvider(postStateNotifierProvider);
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          postStateNotifier.addPost();
          Navigator.of(context).pop();
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
