import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viste/shared/list_widgets1.dart';
import 'package:viste/screens/Test_Page.dart';

class CovoitPage extends StatefulWidget {
  @override
  _CovoitPageState createState() => _CovoitPageState();
}

class _CovoitPageState extends State<CovoitPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: ListView(
          children: [
            MyCovoitWidget(context, Hamdi),
            MyCovoitWidget(context, Ikram),
            MyCovoitWidget(context, Hamdi),
            MyCovoitWidget(context, Ikram),
          ],
        ),
      )
    );
  }
}





