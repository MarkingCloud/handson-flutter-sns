// 依存パッケージ
import 'package:freezed_annotation/freezed_annotation.dart';

// freezed 生成ファイル
part 'post.freezed.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    @Default('') String user,
    @Default('') String body,
    @Default('') String uid,
    @Default('') String photoURL,
    @Default(null) DateTime? timeStamp,
  }) = _Post;
}
