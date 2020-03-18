import 'package:comento_homework/model/forum.dart';
import 'package:comento_homework/tabs/bloc/bloc.dart';
import 'package:comento_homework/tabs/detail/apple_detail_screen.dart';
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
  final int _categoryApple = 1;

  @override
  void initState() {
    super.initState();
    _forumBloc = BlocProvider.of<ForumBloc>(context);
    _forumBloc.add(ForumLoad(category: _categoryApple));
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
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _forum != null ? _forum.length : 0,
                        itemBuilder: (context, index) {
                          return Card(
                              child: InkWell(
                            splashColor: Colors.green.withAlpha(30),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return AppleDetailScreen(id: _forum[index].id,);
                                }
                              ));
                            },
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
                                        Text("Apple"),
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

                                        Text("${_forum[index].created_at}")
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                    ),
                                    Text(
                                      "${_forum[index].title.length > 40 ? _forum[index].title.substring(0, 39) + "..." : _forum[index].title}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${_forum[index].contents.length > 60 ? _forum[index].contents.substring(0, 59) + "..." : _forum[index].contents}",
                                    )
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
