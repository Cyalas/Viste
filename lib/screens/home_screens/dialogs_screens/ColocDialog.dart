import 'package:flutter/material.dart';
import 'package:viste/shared/constants.dart';
import 'package:viste/shared/list_widgets1.dart';


class ColocDialog extends StatefulWidget {
  GlobalKey<ScaffoldState> ScaffoldKey;
  ColocDialog(this.ScaffoldKey);
  @override
  _ColocDialogState createState() => _ColocDialogState(this.ScaffoldKey);
}

class _ColocDialogState extends State<ColocDialog> {
  _ColocDialogState(this.ScaffoldKey);
  GlobalKey<ScaffoldState> ScaffoldKey;
  String _dropdownStatus;
  String _dropdownVille;
  String _Quartier;
  String _Budget;
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
                SizedBox(width: 5,),
                myDropdownInput(
                  text: 'Ville',
                  style: textTheme,
                  value: _dropdownVille,
                  ListValues: Liste_Villes,
                ),
                Expanded(
                    child: TextFormField(
                      // maxLength: 20,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Quartier ',
                        labelStyle: textTheme,
                      ),
                      style: textTheme,
                    )
                ),
                Flexible(
                    child: TextFormField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Budget/Prix ',
                        labelStyle: textTheme,
                      ),
                      style: textTheme,
                    )
                ),
                SizedBox(height: 10),
                LastRowDialog(
                  Icone: Icons.send_sharp,
                  alert: Alerte_coloc_envoye,
                  Scaffoldkey: this.ScaffoldKey,
                )
              ],
            ),
          ),
        )
    );
  }
}



