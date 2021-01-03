import 'package:flutter/material.dart';
import 'package:viste/models/GroupModels.dart';
import 'package:viste/shared/constants.dart';
import 'package:viste/models/UserModel.dart';

// LIST WIDGETS :
// myTextInput
// myDropdownInput
// FromTo
// CovoitWidget
// MyPt
// PtTex
// ColocData
// ColocWidget
// MsgGroupeWidget
// IconTex
// LastRowDialog


// --- Text Forms
class myTextInput extends StatefulWidget {
  final String text;
  final TextStyle style;
  myTextInput({this.text, this.style});
  // @override
  _myTextInputState createState() => _myTextInputState(this.text,this.style);
}

class _myTextInputState extends State<myTextInput> {
  _myTextInputState(this.text,this.style);
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: TextFormField(
          autocorrect: false,
          decoration: InputDecoration(
            labelText: this.text,
            labelStyle: this.style,
          ),
          style: this.style,
        )
    );
  }
}

// --- DropdownButtonFormField
class myDropdownInput extends StatefulWidget {
  final String text;
  final TextStyle style;
  final dynamic value;
  final List<dynamic> ListValues;

  myDropdownInput({this.text,this.style,this.value,this.ListValues});

  _myDropdownInputState createState() => _myDropdownInputState(this.text,this.style,this.value, this.ListValues);
}

class _myDropdownInputState extends State<myDropdownInput> {
  _myDropdownInputState(this.text,this.style,this.value, this.ListValues);
  final String text;
  final TextStyle style;
  final List<dynamic> ListValues;
  dynamic value;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: this.text,
          labelStyle: this.style,
        ),
        value: this.value,
        items: ListValues.map((value) {
          return DropdownMenuItem<String>(
            child: Text(
              value,
              style: this.style,
            ),
            value: value,
          );
        }).toList(),
        onChanged: (newVal) {
          setState(() {
            this.value = newVal;
          });
        },
      ),
    );

  }
}

// ----- From To
class FromTo extends StatefulWidget {
  final String Date;
  final String Time1;
  final String Ville1;
  final String Time2;
  final String Ville2;

  FromTo({this.Date,this.Time1, this.Ville1,this.Time2,this.Ville2});
  @override
  _FromToState createState() => _FromToState(this.Date, this.Time1, this.Ville1,this.Time2,this.Ville2);
}

class _FromToState extends State<FromTo> {
  _FromToState(this.Date, this.Time1, this.Ville1,this.Time2,this.Ville2);

  final String Date;
  final String Time1;
  final String Ville1;
  final String Time2;
  final String Ville2;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double txt_size = 80;
    double time_size= 40;
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 20,0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: time_size,
                  child: Text(
                    this.Time1,
                    style: textTheme.headline4,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      shape: BoxShape.circle,
                      border: Border.all(width: 3, color: secondaryColor)
                  ),
                ),
                SizedBox(width: 2),
                Container(
                    width: txt_size,
                    child: Text(
                      this.Ville1,
                      style: textTheme.headline4,
                    )
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: time_size+5,
                ),
                Container(
                    height: 30,
                    child: VerticalDivider(thickness: 3, color: secondaryColor, )
                ),
                Container(
                  width: txt_size+7,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    width: time_size,
                    child: Text(
                      this.Time2,
                      style: textTheme.headline4,
                    )
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      shape: BoxShape.circle,
                      border: Border.all(width: 3, color: secondaryColor)
                  ),
                ),
                SizedBox(width: 2),
                Container(
                    width: txt_size,
                    child: Text(
                      this.Ville2,
                      style: textTheme.headline4,
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---- Covoit
class CovoitWidget extends StatefulWidget {
  final UserModel Sender;
  CovoitWidget(this.Sender);

  @override
  _CovoitWidgetState createState() => _CovoitWidgetState(this.Sender);
}

class _CovoitWidgetState extends State<CovoitWidget> {
  _CovoitWidgetState(this.Sender);
  final UserModel Sender;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Icons_paths[Sender.Ecole],scale: 3),
                Text(
                  Sender.Covoits[0].status + ' le ${Sender.Covoits[0].Date}',
                  style: textTheme.headline5,
                ),
                Text(Sender.Covoits[0].DatePubli, style: textTheme.headline6)
                // Container(width: 15)
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(3, 2, 1, 10),
                  child: Image.asset(Icons_paths[Sender.Sexe],scale: 10),
                ),
                SizedBox(width: 5),
                FromTo(Time1: Sender.Covoits[0].FromTime,Ville1: Sender.Covoits[0].FromCity,
                    Time2: Sender.Covoits[0].ToTime ,Ville2: Sender.Covoits[0].ToCity,
                Date: 'Le ${Sender.Covoits[0].Date}'),
                IconButton(onPressed: (){}, icon: Icon(Icons.send_sharp), color: secondaryColor, iconSize: 30,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyPt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.2),
          shape: BoxShape.circle,
          border: Border.all(width: 3, color: secondaryColor)
      ),
    );
  }
}

// --- PtTex
class PtTex extends StatelessWidget {
  final String text;
  PtTex(this.text);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double txt_size = 200;
    return Row(
      children: [
        SizedBox(width: 3),
        MyPt(),
        SizedBox(width: 3),
        LimitedBox(
          maxWidth: txt_size,
          child: Container(
              // width: txt_size,
              child: Text(
                this.text,
                style: textTheme.headline4,
              )
          ),
        ),
      ],
    );
  }
}

// --- Coloc Data
class ColocData extends StatefulWidget {
  String ville;
  String quartier;
  String budget;

  ColocData({this.ville, this.quartier, this.budget});
  @override
  _ColocDataState createState() => _ColocDataState(this.ville, this.quartier, this.budget);
}

class _ColocDataState extends State<ColocData> {
  _ColocDataState(this.ville, this.quartier, this.budget);
  String ville;
  String quartier;
  String budget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PtTex('Location à :  ${this.ville}'),
            PtTex('Proche de  : ${this.quartier}'),
            PtTex('Budget       : ${this.budget}'),
          ],
        ),
      ),
    );
  }
}

// --- Coloc Widget
class ColocWidget extends StatefulWidget {
  final UserModel Sender;
  ColocWidget(this.Sender);
  @override
  _ColocWidgetState createState() => _ColocWidgetState(this.Sender);
}

class _ColocWidgetState extends State<ColocWidget> {
  _ColocWidgetState(this.Sender);
  final UserModel Sender;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Icons_paths[Sender.Ecole], scale: 3),
                Text(
                  Sender.Colocs[0].status,
                  style: textTheme.headline5,
                ),
                Text(Sender.Colocs[0].DatePubli, style: textTheme.headline6)
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(3, 2, 1, 10),
                  child: Image.asset(Icons_paths[Sender.Sexe],scale: 10),
                ),
                SizedBox(width: 5),
                ColocData(ville: Sender.Colocs[0].ville,quartier: Sender.Colocs[0].quartier, budget: Sender.Colocs[0].budget),
                IconButton(onPressed: (){}, icon: Icon(Icons.send_sharp), color: secondaryColor, iconSize: 30,)
              ],
            )
          ],
        ),
      ),
    );;
  }
}


// --- MsgGroupeWidget
class MsgGroupeWidget extends StatelessWidget {
  final UserModel Sender;

  MsgGroupeWidget(this.Sender);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    MsgGroupeModel msg = this.Sender.Groupes[0].Content[0];
    return Card(
      margin: EdgeInsets.all(7),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text(Sender.Groupes[0].Nom, style: textTheme.headline5, textAlign: TextAlign.center)),
                  Text(msg.DatePubli, style: textTheme.headline6)
                ],
              ),
              // Center(child: Text(Sender.Groupes[0].Nom, style: textTheme.headline5,)),
              Row(children: [
                Text(
                    'Objet: ${msg.Objet}',
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                    )
                )

              ]),
              SizedBox(height: 10),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(msg.Content)),
            ],
          )
      ),
    );
  }
}

// --- IconTex
class IconTex extends StatelessWidget {
  final MenuModel TextnIcon;
  final GlobalKey<ScaffoldState> Scaffoldkey;
  IconTex({this.TextnIcon, this.Scaffoldkey});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(this.TextnIcon.Icone, color: Colors.black, size: 20),
        SizedBox(width: 5,),
        Text(
          this.TextnIcon.text,
          style: TextStyle(
            color: secondaryColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class MenuModel {
  final String text;
  final IconData Icone;
  MenuModel({this.text, this.Icone});
}


// --- Last row Dialog
class LastRowDialog extends StatelessWidget {
  GlobalKey<ScaffoldState> Scaffoldkey;
  IconData Icone;
  String alert;
  LastRowDialog({this.Icone, this.alert, this.Scaffoldkey});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme0 = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Annuler',
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            this.Scaffoldkey.currentState.showSnackBar(
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
                            this.alert,
                            style: textTheme0.headline3
                        ),
                      ),
                    ],
                  ),
                  duration: Duration(seconds: 4),
                )
            );
            Navigator.of(context).pop();
          },
          icon: Icon(this.Icone),
          color: secondaryColor,
          iconSize: 30,
        ),
      ],
    );
  }
}

