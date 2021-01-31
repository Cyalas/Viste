import 'package:flutter/material.dart';
import 'package:viste/screens/Test_Page.dart';
import 'package:viste/shared/list_widgets1.dart';


class ColocPage extends StatefulWidget {
  @override
  _ColocPageState createState() => _ColocPageState();
}

class _ColocPageState extends State<ColocPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: ListView(
            children: [
              ColocWidget(Ikram),
              ColocWidget(Hamdi),
              ColocWidget(Ikram),
              ColocWidget(Hamdi),
            ],
          ),
        )
    );
  }
}






