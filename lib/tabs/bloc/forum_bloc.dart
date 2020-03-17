import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:comento_homework/model/forum.dart';
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
      if(response != null){
        final contents = response['list']['data'] as List;
//        print("${contents}");
        final List<Forum> forum = contents.map((data) {
          return Forum.fromJson(data);
        }).toList();
        yield ForumState.success(forums: forum);
      }
    } catch (error) {
      print("]-----] _mapForumLoadToState fail [-----[");
      yield ForumState.failure();
    }
  }

  Future<dynamic> get(String url) async {
      print("get in future get url is ${apiUrl+url}");
      final response = await http.get(apiUrl + url);
      print("]-----] get:response [-----[ ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 500) {
        if (response.body != null) {
          print("${json.decode(utf8.decode(response.bodyBytes))}");
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
