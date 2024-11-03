// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      ownerId: json['ownerId'] as String,
      content: json['content'] as String,
      star: (json['star'] as num).toInt(),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'ownerId': instance.ownerId,
      'content': instance.content,
      'star': instance.star,
      'email': instance.email,
    };
