import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String email_verified_at;
  final String created_at;

  const User({
    this.id,
    this.name,
    this.email,
    this.email_verified_at,
    this.created_at,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'User { id: $id}';
}
