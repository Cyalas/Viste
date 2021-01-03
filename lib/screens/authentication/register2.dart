import 'package:viste/shared/list_widgets1.dart';
import 'package:flutter/material.dart';
import 'package:viste/shared/constants.dart';


class RegisterPage2 extends StatefulWidget {
  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  bool registred = false;
  final mainKey = GlobalKey<ScaffoldState>();

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
            style: textTheme.headline3,
          ),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(40),
              child: Form(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        myTextInput(text: 'Email',style: textTheme.headline2),
                      ],
                    ),
                    SizedBox(height: ScreenSize.width/15),
                    Row(
                      children: [
                        myTextInput(text: 'Mot de passe', style: textTheme.headline2),
                      ],
                    ),
                    SizedBox(height: ScreenSize.width/15),
                    Row(
                      children: [
                        myTextInput(text: 'Répéter le mot de passe', style: textTheme.headline2),
                      ],
                    ),
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
                                            style: textTheme.headline3),
                                        ),
                                      ],
                                    ),
                                    duration: Duration(seconds: 6),
                                  )
                                );
                                Future.delayed(Duration(seconds: 7), () {
                                  Navigator.of(context).popUntil((route) => route.isFirst);
                                });

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

