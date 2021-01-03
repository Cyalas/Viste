import 'package:flutter/material.dart';
import 'package:viste/shared/constants.dart';
import 'package:viste/shared/list_widgets1.dart';


class CovoitDialog extends StatefulWidget {
  GlobalKey<ScaffoldState> ScaffoldKey;
  CovoitDialog(this.ScaffoldKey);
  @override
  _CovoitDialogState createState() => _CovoitDialogState(this.ScaffoldKey);
}

class _CovoitDialogState extends State<CovoitDialog> {
  _CovoitDialogState(this.ScaffoldKey);
  GlobalKey<ScaffoldState> ScaffoldKey;
  String _dropdownStatus;
  String _dropdownVille1;
  String _dropdownVille2;
  @override
  Widget build(BuildContext context) {
    TextStyle textTheme = Theme.of(context).textTheme.headline5;
    return AlertDialog(
        contentPadding: EdgeInsets.all(5),
        content:  Container(
          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          height: 350,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                myDropdownInput(
                  text: 'Status',
                  style: textTheme,
                  value: _dropdownStatus,
                  ListValues: Liste_Status,
                ),
                Flexible(
                  child: InputDatePickerFormField(
                    fieldLabelText: 'Date ',
                    firstDate: DateTime(2021,1,01),
                    lastDate: DateTime(2021,12,31),
                  ),
                ),
                Row(
                  children: [
                    myDropdownInput(
                      text: 'De',
                      style: textTheme,
                      value: _dropdownVille1,
                      ListValues: Liste_Villes,
                    ),
                    SizedBox(width: 5),
                    Flexible(
                        child: TextFormField(
                          autocorrect: false,
                          decoration: InputDecoration(
                              labelText: 'à : ',
                              labelStyle: textTheme,
                              hintText: '00:00'
                          ),
                          style: textTheme,
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    myDropdownInput(
                      text: 'Vers',
                      style: textTheme,
                      value: _dropdownVille2,
                      ListValues: Liste_Villes,
                    ),
                    SizedBox(width: 5),
                    Flexible(
                        child: TextFormField(
                          autocorrect: false,
                          decoration: InputDecoration(
                              labelText: 'à : ',
                              labelStyle: textTheme,
                              hintText: '00:00'
                          ),
                          style: textTheme,
                        )
                    ),
                  ],
                ),
                SizedBox(height: 10),
                LastRowDialog(
                  Icone: Icons.send_sharp,
                  alert: Alerte_covoit_envoye,
                  Scaffoldkey: this.ScaffoldKey,
                )
              ],
            ),
          ),
        )
    );
  }
}