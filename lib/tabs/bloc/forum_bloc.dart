import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:comento_homework/model/ads.dart';
import 'package:comento_homework/model/forum.dart';
import 'package:comento_homework/model/reply.dart';
import 'package:comento_homework/model/user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:comento_homework/tabs/bloc/bloc.dart';
import 'package:http/http.dart' as http;

class ForumBloc extends Bloc<ForumEvent, ForumState> {

  final String apiUrl =
      'https://1rcwozojf0.execute-api.ap-northeast-2.amazonaws.com/production';

  @override
  ForumState get initialState => ForumState.emtpy();

  @override
  Stream<ForumState> transformEvents(
    Stream<ForumEvent> events,
    Stream<ForumState> Function(ForumEvent event) next,
  ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<ForumState> mapEventToState(ForumEvent event) async* {
    if (event is ForumLoad) {
      yield* _mapForumLoadToState(event.category);
    } else if(event is DetailLoad) {
      yield* _mapDetailLoadToState(event.id);
    }
  }

  Stream<ForumState> _mapForumLoadToState(int category) async* {
    String page = "page=1&";
    String ord = "ord=asc&";
    String categoryStr = "category[]=$category&";
    String limitStr = "limit=33";
    try {
      print("]-----] _mapForumLoadToState try [-----[");

      final response = await get("/api/list?" + page + ord + categoryStr + limitStr);
      final responseAds = await get("/api/ads?page=1&limit=100");

      if(response != null && responseAds != null){
        final contents = response['list']['data'] as List;
//        print("${contents}");
        final List<Forum> forum = contents.map((data) {
          return Forum.fromJson(data);
        }).toList();

        final contentsAds = responseAds['list']['data'] as List;
        final List<Ads> ads = contentsAds.map((data) {
          return Ads.fromJson(data);
        }).toList();

        yield ForumState.success(forums: forum, ads: ads);
      }
    } catch (error) {
      print("]-----] _mapForumLoadToState fail [-----[");
      yield ForumState.failure();
    }
  }

  Stream<ForumState> _mapDetailLoadToState(int id) async* {
    String idString = "id=${id.toString()}";
    try {
      print("]-----] _mapDetailLoadToState try [-----[");

      final response = await get("/api/view?" + idString);
      if(response != null){
        final Forum forum = Forum.fromJson(response['info']);
        final replies = response['info']['reply'] as List;
        final List<Reply> reply = replies.map((data) {
          return Reply.fromJson(data);
        }).toList();
//        final users = response['info']['reply']['user'] as List;
//        final List<User> user = users.map((data){
//          return User.fromJson(data);
//        }).toList();

        yield ForumState.successLoadDetail(forum: forum, replies: reply);
      }
    } catch (error) {
      print("]-----] _mapDetailLoadToState fail [-----[");
      yield ForumState.failure();
    }
  }

  Future<dynamic> get(String url) async {
      print("get in future get url is ${apiUrl+url}");
      final response = await http.get(apiUrl + url);
      print("]-----] get:response [-----[ ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 500) {
        if (response.body != null) {
//          print("${json.decode(utf8.decode(response.bodyBytes))}");
          return json.decode(utf8.decode(response.bodyBytes));
        } else {
          return null;
        }
      }
      else {
        throw Exception('Error fetching get');
      }

  }
}
