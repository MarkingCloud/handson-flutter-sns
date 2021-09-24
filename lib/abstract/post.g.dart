// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      user: json['user'] as String? ?? '',
      body: json['body'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      photoURL: json['photoURL'] as String? ?? '',
      timeStamp: json['timeStamp'] == null
          ? null
          : const TimestampConverter()
              .fromJson(json['timeStamp'] as Timestamp?),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'user': instance.user,
      'body': instance.body,
      'uid': instance.uid,
      'photoURL': instance.photoURL,
      'timeStamp': const TimestampConverter().toJson(instance.timeStamp),
    };
