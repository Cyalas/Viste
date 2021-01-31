import 'package:firebase_auth/firebase_auth.dart';
import 'package:viste/screens/home.dart';
import 'package:viste/shared/list_widgets1.dart';
import 'package:flutter/material.dart';
import 'package:viste/shared/constants.dart';
import 'package:viste/models/UserModel.dart';
import 'package:viste/services/auth.dart';


class RegisterPage2 extends StatefulWidget {
  final UserModel UserToComplete;

  RegisterPage2({Key key, @required this.UserToComplete}): super(key: key);
  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  bool registred = false;
  final mainKey = GlobalKey<ScaffoldState>();
  final _formKey2 = GlobalKey<FormState>();

  AuthMethods authMethods = AuthMethods();

  TextEditingController _EmailValue = TextEditingController();
  TextEditingController _PasswordValue = TextEditingController();

  UserModel UserComplete(UserModel UserToComplete){

    if (_formKey2.currentState.validate()){
      print('validated');
      UserToComplete.Email = _EmailValue.text;
      UserToComplete.Password = _PasswordValue.text;
      authMethods.Register(UserToComplete).then((value) {
        mainKey.currentState.showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(
                    Icons.info,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                        Alerte_registration,
                        style: TextStyle(
                          color: thirdColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),),
                  ),
                ],
              ),
              duration: Duration(seconds: 6),
            )
        );
        Future.delayed(Duration(seconds: 7), () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        });
      });
    }

    print('not validated');
    // return UserToComplete;
  }
  @override
  Widget build(BuildContext context) {

    Size ScreenSize = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        key: mainKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0.0,
          title: Text(
            'Inscription',
            style: TextStyle(
              color: thirdColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(40),
              child: Form(
                key: _formKey2,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      controller: _EmailValue,
                      validator: (val){
                        // RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                        // null : "Adresse Email invalide.";
                        if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)){
                          // print('Null');
                          return null;
                        } else {
                          // print('ELSE');
                          return "Adresse Email invalide";
                        }
                      },
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: textTheme.headline2,
                      ),
                      style: textTheme.headline2,
                    ),
                    SizedBox(height: ScreenSize.width/15),
                    TextFormField(
                      controller: _PasswordValue,
                      validator: (val){
                        return val.length>6 ? null : "Mot de passe > 6";
                      },
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        labelStyle: textTheme.headline2,
                      ),
                      style: textTheme.headline2,
                    ),
                    // SizedBox(height: ScreenSize.width/15),
                    // Row(
                    //   children: [
                    //     myTextInput(text: 'Répéter le mot de passe', style: textTheme.headline2),
                    //   ],
                    // ),
                    SizedBox(height: ScreenSize.width/2),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                              color: primaryColor,
                              child: Text(
                                'Valider',
                                style: textTheme.headline3,
                              ),
                              onPressed: (){
                                UserComplete(widget.UserToComplete);
                              }
                          ),
                        ]),

                  ],
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }
}

