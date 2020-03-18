import 'package:comento_homework/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reply.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Reply extends Equatable {
  final int id;
  final int user_id;
  final int parent;
  final String contents;
  final String created_at;

  const Reply({
    this.id,
    this.user_id,
    this.parent,
    this.contents,
    this.created_at,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Detail { id: $id}';
}
