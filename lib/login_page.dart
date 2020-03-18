import 'package:comento_homework/model/user.dart';
import 'package:comento_homework/tabs/tabs_main.dart';
import 'package:comento_homework/user_repository.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  final UserRepository _userRepository;

  LoginPage({
    Key key,
    @required UserRepository userRepository,
  }) : assert(userRepository != null),
  _userRepository = userRepository,
        super(key: key);

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nickNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  UserRepository get _userRepository => widget._userRepository;
//  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 30.0, left: 30.0, top: 30.0, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _nickNameController,
                      decoration: InputDecoration(labelText: "닉네임", hintText: "입력해주세요."),
                      validator: (value){
                        if(value.isEmpty) {
                          return "닉네임을 입력해주세요.";
                        }else if(value.length > 12){
                          return "닉네임이 너무 깁니다.";
                        }
                        else return null;
                      },
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
                          if(_formKey.currentState.validate()){
                            _userRepository.persistNickName(_nickNameController.text);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) {
                                  return TabsMain(nickName: _nickNameController.text.toString(),);
                                },
                              ),
                            );
                          }

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
