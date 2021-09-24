// 依存パッケージ
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// freezed 生成ファイル
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    @Default('') String user,
    @Default('') String body,
    @Default('') String uid,
    @Default('') String photoURL,
    @Default(null) @TimestampConverter() DateTime? timeStamp,
  }) = _Post;
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampConverter();
  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();
  @override
  Timestamp? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}
