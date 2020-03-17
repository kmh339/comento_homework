import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forum.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Forum extends Equatable {
  final int id;
  final String title;
  final String contents;
  final int category_id;
  final int user_id;
  final String created_at;

  const Forum({
    this.id,
    this.title,
    this.contents,
    this.category_id,
    this.user_id,
    this.created_at,
  });

  factory Forum.fromJson(Map<String, dynamic> json) => _$ForumFromJson(json);

  Map<String, dynamic> toJson() => _$ForumToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Forum { id: $id}';
}
