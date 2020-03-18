import 'package:meta/meta.dart';
import 'package:comento_homework/model/forum.dart';
import 'package:comento_homework/model/reply.dart';
import 'package:comento_homework/model/user.dart';

@immutable
class ForumState {
  final bool isLoaded;
  final bool isLoading;
  final List<Forum> forum;
  final List<Reply> reply;
  final List<User> user;
  final Forum forumDetail;

  ForumState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.forum,
    @required this.reply,
    @required this.user,
    @required this.forumDetail,
  });

  factory ForumState.emtpy() {
    return ForumState(
      isLoaded: false,
      isLoading: false,
      forum: null,
      reply: null,
      user: null,
      forumDetail: null,
    );
  }

  factory ForumState.failure() {
    return ForumState(
      isLoaded: false,
      isLoading: false,
      forum: null,
      reply: null,
      user: null,
      forumDetail: null,
    );
  }

  factory ForumState.success({List<Forum> forums}) {
    return ForumState(
      isLoaded: true,
      isLoading: false,
      forum: forums,
    );
  }

  factory ForumState.successLoadDetail({Forum forum, List<Reply> replies, List<User> users}) {
    return ForumState(
      isLoaded: true,
      isLoading: false,
      forumDetail: forum,
      reply: replies,
      user: users,

    );
  }




}
