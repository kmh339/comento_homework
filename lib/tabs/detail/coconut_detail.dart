import 'package:comento_homework/model/forum.dart';
import 'package:comento_homework/model/reply.dart';
import 'package:comento_homework/tabs/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoconutDetail extends StatefulWidget {
  final int _id;

  CoconutDetail({
    Key key,
    @required int id,
  })  : assert(id != null),
        _id = id,
        super(key: key);

  @override
  State<CoconutDetail> createState() => _CoconutDetailState();
}

class _CoconutDetailState extends State<CoconutDetail> {
  int get _id => widget._id;
  ForumBloc _forumBloc;
  List<Reply> _reply;
  Forum _forum;

  @override
  void initState() {
    super.initState();
    _forumBloc = BlocProvider.of<ForumBloc>(context);
    _forumBloc.add(DetailLoad(id: _id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForumBloc, ForumState>(
      listener: (context, state) {
        if (state.isLoaded) {
          setState(() {
            _forum = state.forumDetail;
            _reply = state.reply;
          });
        }
      },
      child: BlocBuilder<ForumBloc, ForumState>(
        builder: (context, state) {
          if (state.isLoaded) {
            _forum = state.forumDetail;
            _reply = state.reply;

            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Coconut"),
                                    Text("${_forum.id}")
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
                                    Text("${_forum.created_at}")
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                Text(
                                  "${_forum.title}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${_forum.contents}",
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 600,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: _reply != null ? _reply.length : 0,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  width: 300,
                                  height: 180,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Coconut"),
                                          Text("${_reply[index].id}")
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
                                          Text("${_reply[index].created_at}")
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                      ),
                                      Text(
                                        "${_reply[index].contents}",
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
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
