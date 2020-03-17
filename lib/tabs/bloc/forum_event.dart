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