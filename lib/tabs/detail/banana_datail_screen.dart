import 'package:comento_homework/tabs/bloc/bloc.dart';
import 'package:comento_homework/tabs/detail/banana_datail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BananaDetailScreen extends StatefulWidget {
  final int _id;

  BananaDetailScreen({
    Key key,
    @required int id,
  })  : assert(id != null),
        _id = id,
        super(key: key);

  @override
  _BananaDetailScreenState createState() => _BananaDetailScreenState();
}

class _BananaDetailScreenState extends State<BananaDetailScreen> {
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
        child: BananaDetail(id: _id,),
      ),
    );
  }
}
