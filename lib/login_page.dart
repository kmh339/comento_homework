import 'package:comento_homework/tabs/tabs_main.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  LoginPage({
    Key key,
  }) : super(key: key);

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nickNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Form(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 30.0, left: 30.0, top: 30.0, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _nickNameController,
                      decoration: InputDecoration(labelText: "닉네임", hintText: "입력해주세요."),
                      autovalidate: true,
                      autocorrect: false,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    SizedBox(
                      width: 800.0,
                      height: 45.0,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.green[300],
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return TabsMain();
                              },
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text("로그인"),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      );

  }
}
