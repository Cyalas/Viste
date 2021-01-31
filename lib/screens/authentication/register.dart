import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viste/models/UserModel.dart';
import 'package:viste/screens/authentication/register2.dart';
import 'package:viste/shared/constants.dart';
import 'package:viste/shared/list_widgets1.dart';
import 'package:date_util/date_util.dart';
import 'package:viste/screens/Test_Page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  DateUtil _DayN = DateUtil();
  int _LastDayOfMonth;
  String _SexeValue;
  String _EcoleValue;
  String _FiliereValue;
  String _GroupeValue;
  String _MoisNaissanceValue;
  String _JourNaissanceValue;
  String _AnneeNaissanceValue;
  String _PromoValue;


  List<String> _FilieresEcoles=[''];
  List<String> _GroupesEcoles=[''];

  final _FilieresKey = GlobalKey<FormFieldState>();
  final _GroupesKey = GlobalKey<FormFieldState>();
  final _formkey = GlobalKey<FormState>();

  TextEditingController _NomValue = TextEditingController();
  TextEditingController _PrenomValue = TextEditingController();

  List<int> _List_Days = [for (var day = 1;  day <= 30;  day += 1)  day];

  UserModel UserCreation(){
    UserModel NewUser = UserModel();

    if (_formkey.currentState.validate()){
      NewUser.Nom = _NomValue.text;
      NewUser.Prenom = _PrenomValue.text;
      NewUser.Sexe = _SexeValue;
      NewUser.Ecole = _EcoleValue;
      NewUser.DateNaissance = [_AnneeNaissanceValue,_MoisNaissanceValue,_JourNaissanceValue];
      NewUser.Filiere = _FiliereValue;
      NewUser.Promo = int.parse(_PromoValue);
      NewUser.Groupes = [AMEIGR,];
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          RegisterPage2(UserToComplete: NewUser,)),);
    }

  }


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
            style: TextStyle(
              color: thirdColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(40, 40, 40, 5),
                  child:Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        // ====================== NOM & PRENOM
                        TextFormField(
                          controller: _NomValue,
                          validator: (val){
                            return  val.length>2 ? null : "Nom invalide";
                          },
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: 'Nom',
                            labelStyle: textTheme.headline2,
                          ),
                          style: textTheme.headline2,
                        ),
                        SizedBox(height: ScreenSize.height/30),
                        TextFormField(
                          controller: _PrenomValue,
                          validator: (val){
                            return  val.length>2 ? null : "Prénom invalide";
                          },
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: 'Prénom',
                            labelStyle: textTheme.headline2,
                          ),
                          style: textTheme.headline2,
                        ),
                        SizedBox(height: ScreenSize.height/30),
                        // ====================== SEXE & INSTITUT
                        Row(
                          children: [
                            Flexible(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Sexe',
                                    labelStyle: textTheme.headline2,
                                  ),
                                  value: _SexeValue,
                                  items: Liste_Sexe.map((value) {
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
                                      _SexeValue = newVal;
                                    });
                                  },
                                )
                            ),

                            SizedBox(width: ScreenSize.width/15),
                            Flexible(
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Institut/Ecole',
                                  labelStyle: textTheme.headline2,
                                ),
                                value: _EcoleValue,
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
                                    _EcoleValue = newVal;
                                    if (!Liste_Filieres[_EcoleValue].contains(_FilieresKey.currentState.value.toString())){
                                      _FiliereValue = null;
                                    }
                                    _FilieresEcoles = Liste_Filieres[_EcoleValue];
                                    _GroupesEcoles = Liste_Groupes[_EcoleValue];
                                  });
                                },
                              )
                            ),
                        ]),
                        SizedBox(height: ScreenSize.height/30),
                        // ====================== DATE DE NAISSANCE
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Date de naissance',
                              style: textTheme.headline2),
                        ),
                       Row(
                         children: [
                           // myDropdownWidget(context, 'Mois', textTheme.headline2, _MoisNaissanceValue, Liste_Mois, setStateFunc),
                           Flexible(
                             child: DropdownButtonFormField<String>(
                                 decoration: InputDecoration(
                                   labelText: 'Année',
                                   labelStyle: TextStyle(
                                     color: secondaryColor,
                                     fontSize: 17.0,
                                   ),
                                 ),
                                 value: _AnneeNaissanceValue,
                                 items: Liste_Annees.reversed.map((value) {
                                   return DropdownMenuItem<String>(
                                     child: Text(
                                       value.toString(),
                                       style: textTheme.headline2,
                                     ),
                                     value: value.toString(),
                                   );
                                 }).toList(),
                                 onChanged: (val){
                                   setState(() {
                                     _AnneeNaissanceValue = val;
                                   });
                                 }
                             ),
                           ),
                           Flexible(
                             child: DropdownButtonFormField<String>(
                                 decoration: InputDecoration(
                                   labelText: 'Mois',
                                   labelStyle: TextStyle(
                                     color: secondaryColor,
                                     fontSize: 17.0,
                                   ),
                                 ),
                                 value: _MoisNaissanceValue,
                                 items: Liste_Mois.map((value) {
                                   return DropdownMenuItem<String>(
                                     child: Text(
                                       value,
                                       style: textTheme.headline2,
                                     ),
                                     value: value,
                                   );
                                 }).toList(),
                                 onChanged: (val){
                                   setState(() {
                                     int index_mois;
                                        _MoisNaissanceValue = val;
                                        index_mois = Liste_Mois.indexOf(
                                                _MoisNaissanceValue) +1;
                                        _LastDayOfMonth = _DayN.daysInMonth(
                                            index_mois, int.parse(_AnneeNaissanceValue));
                                        _List_Days = [
                                          for (var day = 1;
                                              day <= _LastDayOfMonth;
                                              day += 1)
                                            day
                                        ];
                                    });
                                 }
                             ),
                           ),
                           Flexible(
                             child: DropdownButtonFormField<String>(
                                 decoration: InputDecoration(
                                   labelText: 'Jour',
                                   labelStyle: TextStyle(
                                     color: secondaryColor,
                                     fontSize: 16.0,
                                   ),
                                 ),
                                 value: _JourNaissanceValue,
                                 items: _List_Days.map((value) {
                                   return DropdownMenuItem<String>(
                                     child: Text(
                                       value.toString(),
                                       style: textTheme.headline2,
                                     ),
                                     value: value.toString(),
                                   );
                                 }).toList(),
                                 onChanged: (val){
                                   setState(() {
                                     _JourNaissanceValue = val;
                                   });
                                 }
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
                                value: _FiliereValue,
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
                                    _FiliereValue = newVal;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: ScreenSize.width/15),
                            Flexible(
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Année de promo',
                                    labelStyle: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  value: _PromoValue,
                                  items: Liste_Promo.map((value) {
                                    return DropdownMenuItem<String>(
                                      child: Text(
                                        value.toString(),
                                        style: textTheme.headline2,
                                      ),
                                      value: value.toString(),
                                    );
                                  }).toList(),
                                  onChanged: (val){
                                    setState(() {
                                      _PromoValue = val;
                                    });
                                  }
                              ),
                            ),
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
                                value: _GroupeValue,
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
                                    _GroupeValue = newVal;
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
                                  UserCreation();
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
        ),
      ),
    );
  }
}

