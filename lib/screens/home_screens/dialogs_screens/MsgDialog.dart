import 'package:flutter/material.dart';
import 'package:viste/shared/list_widgets1.dart';
import 'package:viste/shared/constants.dart';
// MAX LENGTH in TEXTFORMINPUT

class MsgDialog extends StatefulWidget {
  GlobalKey<ScaffoldState> ScaffoldKey;
  MsgDialog(this.ScaffoldKey);
  @override
  _MsgDialogState createState() => _MsgDialogState(this.ScaffoldKey);
}

class _MsgDialogState extends State<MsgDialog> {
  _MsgDialogState(this.ScaffoldKey);
  GlobalKey<ScaffoldState> ScaffoldKey;
  String _dropdownGroupe;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme0 = Theme.of(context).textTheme;
    TextStyle textTheme = Theme.of(context).textTheme.headline5;
    return AlertDialog(
        contentPadding: EdgeInsets.all(5),
    content: Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        height: 500,
        width: 400,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myDropdownInput(
                text: 'Groupe',
                style: textTheme,
                value: _dropdownGroupe,
                ListValues: List_Groupes_IAV,
              ),
              Flexible(
                flex: 2,
                child: TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Objet ',
                      labelStyle: textTheme,
                    ),
                    style: textTheme,
                  ),
              ),
              SizedBox(height: 5,),
              Flexible(
                flex: 4,
                child: TextFormField(
                    maxLines: 7,
                    maxLength: 250,
                    decoration: InputDecoration(
                      hintText: 'Texte ',
                    ),
                  ),
              ),
              LastRowDialog(
                Icone: Icons.send_sharp,
                alert: Alerte_msg_envoye,
                Scaffoldkey: this.ScaffoldKey,
              )
            ],
          )
        )
    )
    );
  }
}
