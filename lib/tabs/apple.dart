import 'package:comento_homework/model/forum.dart';
import 'package:comento_homework/tabs/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Apple extends StatefulWidget {
  Apple({
    Key key,
  }) : super(key: key);

  @override
  State<Apple> createState() => _AppleState();
}

class _AppleState extends State<Apple> {
  ForumBloc _forumBloc;
  List<Forum> _forum;

  @override
  void initState() {
    super.initState();
    _forumBloc = BlocProvider.of<ForumBloc>(context);
    _forumBloc.add(ForumLoad(category: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForumBloc, ForumState>(
      listener: (context, state) {
        if (state.isLoaded) {
          setState(() {
            _forum = state.forum;
          });
        }
      },
      child: BlocBuilder<ForumBloc, ForumState>(
        builder: (context, state) {
          if (state.isLoaded) {
            _forum = state.forum;
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "???님 안녕하세요.",
                      style: TextStyle(fontSize: 16),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _forum != null ? _forum.length : 0,
                        itemBuilder: (context, index) {
                          return Card(
                              child: InkWell(
                            splashColor: Colors.green.withAlpha(30),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                width: 300,
                                height: 140,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("${_forum[index].category_id}"),
                                        Text("${_forum[index].id}")
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black38,
                                      height: 10,
                                      thickness: 0.7,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("이메일"),
                                        Text("  |  "),
                                        Text("작성일")
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                    ),
                                    Text(
                                      "글제목",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("글내용")
                                  ],
                                ),
                              ),
                            ),
                          ));
                        },
                      ),
                    )
                  ],
                )),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.lightGreenAccent),
              ),
            );
          }
        },
      ),
    );
  }
}
