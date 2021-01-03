import 'package:flutter/material.dart';
import 'package:viste/shared/list_widgets1.dart';
import 'package:viste/shared/constants.dart';

class AddGroupeDialog extends StatefulWidget {
  GlobalKey<ScaffoldState> ScaffoldKey;
  AddGroupeDialog(this.ScaffoldKey);
  @override
  _AddGroupeDialogState createState() => _AddGroupeDialogState(this.ScaffoldKey);
}

class _AddGroupeDialogState extends State<AddGroupeDialog> {
  _AddGroupeDialogState(this.ScaffoldKey);
  GlobalKey<ScaffoldState> ScaffoldKey;
  String _dropdownUsers;
  @override
  Widget build(BuildContext context) {
    TextStyle textTheme = Theme.of(context).textTheme.headline5;

    return AlertDialog(
      contentPadding: EdgeInsets.all(5),
      content: Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        height: 200,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myTextInput(text: 'Nom',style: textTheme),
              myTextInput(text: 'Gérants',style: textTheme),
              LastRowDialog(
                Icone: Icons.add_circle_outline,
                alert: Alerte_creation_groupe,
                Scaffoldkey: this.ScaffoldKey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
