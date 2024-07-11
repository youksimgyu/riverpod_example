import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  // camel case
  // 예시 user_id -> userId
  // snake case
  // 예시 user_id -> user_id

  // @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PostModel({
    // @JsonKey(name: 'user_id')
    int? userId,
    int? id,
    String? title,
    String? body,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
