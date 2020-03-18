import 'package:comento_homework/tabs/bloc/bloc.dart';
import 'package:comento_homework/tabs/detail/coconut_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoconutDetailScreen extends StatefulWidget {
  final int _id;

  CoconutDetailScreen({
    Key key,
    @required int id,
  })  : assert(id != null),
        _id = id,
        super(key: key);

  @override
  _CoconutDetailScreenState createState() => _CoconutDetailScreenState();
}

class _CoconutDetailScreenState extends State<CoconutDetailScreen> {
  int get _id => widget._id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("디테일 화면"),
      ),
      body: BlocProvider<ForumBloc>(
        create: (context) => ForumBloc(),
        child: CoconutDetail(id: _id,),
      ),
    );
  }
}
