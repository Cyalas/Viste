import 'package:flutter/material.dart';
import 'package:viste/shared/list_widgets1.dart';
import 'package:viste/screens/Test_Page.dart';

class GroupesPage extends StatefulWidget {
  @override
  _GroupesPageState createState() => _GroupesPageState();
}

class _GroupesPageState extends State<GroupesPage> {
  @override
  Widget build(BuildContext context) {
    Hamdi.Groupes = [AMEIGR,];
    Ikram.Groupes= [GR,];
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: ListView(
            children: [
              MsgGroupeWidget(context, Ikram),
              MsgGroupeWidget(context, Hamdi),
              MsgGroupeWidget(context, Ikram),
              MsgGroupeWidget(context, Hamdi),
            ],
          ),
        )
    );
  }
}

