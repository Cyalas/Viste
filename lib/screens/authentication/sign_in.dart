import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viste/screens/authentication/register.dart';
import 'package:viste/shared/constants.dart';


class SignInPage extends StatefulWidget {

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {

    Size ScreenSize = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
              Container(
                width: ScreenSize.width,
                height: ScreenSize.height*.3,
                decoration: BoxDecoration(
                  // color: primaryColor,
                  gradient: LinearG,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset('assets/viste.png'),
                      height: 150,
                      width: 150,
                    ),
                    Text(
                      "Citation ?",
                      style: textTheme.headline1,
                    ),
                  ],
                ),
              ),
            SizedBox(height: ScreenSize.height/35),
            Container(
              padding: EdgeInsets.fromLTRB(40, 5, 40, 5),
              child:Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: textTheme.headline2,
                        hintText: 'agro@matalane.veto',
                      ),
                      style: textTheme.headline2,
                    ),
                    SizedBox(height: ScreenSize.height/35),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          labelStyle: textTheme.headline2,
                          hintText: 'IavTrolls'
                      ),
                      style: textTheme.headline2,
                    ),
                    SizedBox(height: ScreenSize.height/35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          color: Colors.blueGrey[900],
                          iconSize: 45,
                           onPressed: (){}
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenSize.height/13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                            child: Text(
                              'Mot de passe oublié',
                              style: textTheme.headline2,
                            ),
                            onPressed: (){}
                        ),
                        RaisedButton(
                            elevation: .5,
                            color: Colors.blueGrey[900],
                            child: Text(
                              'Inscription',
                              style: textTheme.headline3,
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                            }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
              ),
      ),
    );
  }
}
