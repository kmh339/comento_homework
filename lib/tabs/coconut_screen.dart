import 'package:comento_homework/tabs/coconut.dart';
import 'package:comento_homework/tabs/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoconutScreen extends StatefulWidget {
  CoconutScreen({
    Key key,
  }) : super(key: key);

  @override
  _CoconutScreenState createState() => _CoconutScreenState();
}

class _CoconutScreenState extends State<CoconutScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocProvider<ForumBloc>(
        create: (context) => ForumBloc(),
        child: Coconut(),
      ),
    );
  }
}