import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ForumEvent extends Equatable {
  const ForumEvent();

  @override
  List<Object> get props => [];
}

class ForumLoad extends ForumEvent {
  final int category;

  const ForumLoad({
    @required this.category,
});

  @override
  List<Object> get props => [category];

  @override
  String toString() => 'ForumLoad';
}

class DetailLoad extends ForumEvent {
  final int id;

  const DetailLoad({
    @required this.id,
});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'DetailLoad';
}