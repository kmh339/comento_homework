import 'package:comento_homework/tabs/bloc/bloc.dart';
import 'package:comento_homework/tabs/detail/apple_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppleDetailScreen extends StatefulWidget {
  final int _id;

  AppleDetailScreen({
    Key key,
    @required int id,
  })  : assert(id != null),
        _id = id,
        super(key: key);

  @override
  _AppleDetailScreenState createState() => _AppleDetailScreenState();
}

class _AppleDetailScreenState extends State<AppleDetailScreen> {
  int get _id => widget._id;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

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
        child: AppleDetail(id: _id,),
      ),
    );
  }

}
