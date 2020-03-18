import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ads.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Ads extends Equatable {
  final int id;
  final String title;
  final String contents;
  final String img;
  final String created_at;

  const Ads({
    this.id,
    this.title,
    this.contents,
    this.img,
    this.created_at,
  });

  factory Ads.fromJson(Map<String, dynamic> json) => _$AdsFromJson(json);

  Map<String, dynamic> toJson() => _$AdsToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Ads { id: $id}';
}
