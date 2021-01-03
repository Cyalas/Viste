import 'package:flutter/material.dart';
import 'package:viste/screens/authentication/register2.dart';
import 'package:viste/shared/constants.dart';
import 'package:viste/shared/list_widgets1.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String _dropdownSexe;
  // int _dropdownPromo;
  String _dropdownEcoles;
  String _dropdownFilieres;
  String _dropdownGroupes;
  List<String> _FilieresEcoles=[''];
  List<String> _GroupesEcoles=[''];
  final _FilieresKey = GlobalKey<FormFieldState>();
  final _GroupesKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    // print(_FilieresKey.runtimeType);
    Size ScreenSize = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
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
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(40, 40, 40, 5),
              child:Form(
                child: Column(
                  children: [
                    // ====================== NOM & PRENOM
                    Row(
                      children: [
                        myTextInput(text: 'Nom',style: textTheme.headline2),
                        SizedBox(width: ScreenSize.width/15),
                        myTextInput(text: 'Prénom', style: textTheme.headline2),
                      ],
                    ),
                    SizedBox(height: ScreenSize.height/30),
                    // ====================== SEXE & INSTITUT
                    Row(
                      children: [
                        myDropdownInput(
                          text: 'Sexe',
                          style: textTheme.headline2,
                          value: _dropdownSexe,
                          ListValues: Liste_Sexe,
                        ),
                        SizedBox(width: ScreenSize.width/15),
                        Flexible(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Institut/Ecole',
                              labelStyle: textTheme.headline2,
                            ),
                            value: _dropdownEcoles,
                            items: Liste_Ecoles.map((value) {
                              return DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: textTheme.headline2,
                                ),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                _dropdownEcoles = newVal;
                                if (!Liste_Filieres[_dropdownEcoles].contains(_FilieresKey.currentState.value.toString())){
                                  _dropdownFilieres = null;
                                }
                                _FilieresEcoles = Liste_Filieres[_dropdownEcoles];
                                _GroupesEcoles = Liste_Groupes[_dropdownEcoles];
                              });
                            },
                          )
                        ),
                    ]),
                    SizedBox(height: ScreenSize.height/30),
                    // ====================== DATE DE NAISSANCE
                    Row(
                      children: [
                        Flexible(
                          child: InputDatePickerFormField(
                            fieldLabelText: 'Date de naissance',
                            firstDate: DateTime(1930),
                            lastDate: DateTime(2020),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenSize.height/30),
                    // ====================== FILIERE & PROMO
                    Row(
                      children: [
                        Flexible(
                          child: DropdownButtonFormField<String>(
                            key: _FilieresKey,
                            isExpanded: true,
                            decoration: InputDecoration(
                              labelText: 'Filière',
                              labelStyle: textTheme.headline2,
                            ),
                            value: _dropdownFilieres,
                            items:  _FilieresEcoles.map((value) {
                              return DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: textTheme.headline2,
                                ),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                _dropdownFilieres = newVal;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: ScreenSize.width/15),
                        myTextInput(text: 'Date de promo',style: textTheme.headline2),
                      ],
                    ),
                    SizedBox(height: ScreenSize.height/30),
                    // ====================== EMAIL & GROUPE
                    Row(
                      children: [
                        Flexible(
                          child: DropdownButtonFormField<String>(
                            key: _GroupesKey,
                            isExpanded: true,
                            decoration: InputDecoration(
                              // https://fluttercore.com/flutter-tagging-input-widget/
                              labelText: 'Groupes (tags)',
                              labelStyle: textTheme.headline2,
                            ),
                            value: _dropdownGroupes,
                            items:  _GroupesEcoles.map((value) {
                              return DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: textTheme.headline2,
                                ),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                _dropdownGroupes = newVal;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenSize.height/10),
                    // ====================== MOT DE PASSE & REPETER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                            color: primaryColor,
                            child: Text(
                              'Suivant',
                              style: textTheme.headline3,
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage2()));
                            }
                        ),
                      ]),
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
