import 'package:meta/meta.dart';
import 'package:comento_homework/model/forum.dart';

@immutable
class ForumState {
  final bool isLoaded;
  final bool isLoading;
  final List<Forum> forum;

  ForumState({
   @required this.isLoaded,
   @required this.isLoading,
   @required this.forum,
});

  factory ForumState.emtpy() {
    return ForumState(
      isLoaded: false,
      isLoading: false,
      forum: null,
    );
  }

  factory ForumState.failure() {
    return ForumState(
      isLoaded: false,
      isLoading: false,
      forum: null,
    );
  }

  factory ForumState.success({List<Forum> forums}){
    return ForumState(
      isLoaded: true,
      isLoading: false,
      forum: forums,
    );
  }
}