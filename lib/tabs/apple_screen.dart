import 'package:comento_homework/tabs/apple.dart';
import 'package:comento_homework/tabs/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppleScreen extends StatefulWidget {
  AppleScreen({
    Key key,
}) : super(key: key);

  @override
  _AppleScreenState createState() => _AppleScreenState();
}

class _AppleScreenState extends State<AppleScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocProvider<ForumBloc>(
        create: (context) => ForumBloc(),
        child: Apple(),
      ),
    );
  }
}