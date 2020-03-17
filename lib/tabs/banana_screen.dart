import 'package:comento_homework/tabs/banana.dart';
import 'package:comento_homework/tabs/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BananaScreen extends StatefulWidget {
  BananaScreen({
    Key key,
  }) : super(key: key);

  @override
  _BananaScreenState createState() => _BananaScreenState();
}

class _BananaScreenState extends State<BananaScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocProvider<ForumBloc>(
        create: (context) => ForumBloc(),
        child: Banana(),
      ),
    );
  }
}