import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:viste/screens/Test_Page.dart';
import 'package:viste/main.dart';
import 'package:viste/shared/list_widgets1.dart';

void main() {
  testWidgets('Given Hamdi & Ikram Users When sending Offre & Demande de coloc Then Coloc Widgets is created', (WidgetTester tester) async {
  // ASSEMBLE
   await tester.pumpWidget(
     Scaffold(
       body: Padding(
           padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
           child: ListView(
               children: [
                 ColocWidget(Ikram),
                ColocWidget(Hamdi), ]
     )
   )
     )
   );

  // ACT

  });
}