import 'package:flutter/material.dart';
import 'package:viste/shared/constants.dart';
import 'package:viste/screens/home_screens/dialogs_screens/CovoitDialog.dart';
import 'package:viste/screens/home_screens/dialogs_screens/ColocDialog.dart';
import 'package:viste/screens/home_screens/dialogs_screens/MsgDialog.dart';

class FirstDialog extends StatefulWidget {
  GlobalKey<ScaffoldState> ScaffoldKey;
  FirstDialog(this.ScaffoldKey);
  @override
  _FirstDialogState createState() => _FirstDialogState(this.ScaffoldKey);
}

class _FirstDialogState extends State<FirstDialog> {
  _FirstDialogState(this.ScaffoldKey);
  GlobalKey<ScaffoldState> ScaffoldKey;

  Future<void> CovoitForm(BuildContext context) async {
    return await showDialog(context: context,
        builder:  (context){
          return CovoitDialog(this.ScaffoldKey);
        });
  }

  Future<void> ColocForm(BuildContext context) async {
    return await showDialog(context: context,
        builder:  (context){
          return ColocDialog(this.ScaffoldKey);
        });
  }


  Future<void> MsgForm(BuildContext context) async {
    return await showDialog(context: context,
        builder:  (context){
          return MsgDialog(this.ScaffoldKey);
        });
  }


  @override
  Widget build(BuildContext context) {

    return AlertDialog(

      content: Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton.icon(
                onPressed: () async {
                  await CovoitForm(context);
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.add_circle_outline),
                label: Text(
                  'Covoit',
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
            FlatButton.icon(
                onPressed: () async {
                  await ColocForm(context);
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.add_circle_outline),
                label: Text(
                  'Coloc',
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
            FlatButton.icon(
                onPressed: () async {
                  await MsgForm(context);
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.add_circle_outline),
                label: Text(
                  'Message',
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),


                ],
        ),

      ),

    );
  }
}



