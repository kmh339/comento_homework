import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Detail extends Equatable {
  final int id;
  final String title;
  final String contents;
  final int category_id;
  final int user_id;
  final String created_at;

  const Detail({
    this.id,
    this.title,
    this.contents,
    this.category_id,
    this.user_id,
    this.created_at,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Detail { id: $id}';
}
