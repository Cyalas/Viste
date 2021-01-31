import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viste/screens/home_screens/ColocPage.dart';
import 'package:viste/screens/home_screens/CovoitPage.dart';
import 'package:viste/screens/home_screens/GroupesPage.dart';
import 'package:viste/screens/home_screens/dialogs_screens/AddGroupeDialog.dart';
import 'package:viste/shared/constants.dart';
import 'package:viste/shared/list_widgets1.dart';
import 'home_screens/dialogs_screens/FirstDialog.dart';
import 'package:viste/screens/Test_Page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearch = false;
  final List<String> _onglets = ['Covoit','Coloc','Groupes'];
  final List<IconData> _icones= [ Icons.directions_car_sharp, Icons.house, Icons.group_sharp];
  List<MenuModel> _MenuChoices = [
    MenuModel(text: Liste_Menu[0],Icone: Icons.group_add_outlined),
    MenuModel(text: Liste_Menu[1],Icone: Icons.settings),
    MenuModel(text: Liste_Menu[2],Icone: Icons.contact_support),
    MenuModel(text: Liste_Menu[3],Icone: Icons.exit_to_app),
  ];

  _buildSearch() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: primaryColor,
      ),
      child: TextField(
        style: TextStyle(
          color: secondaryColor,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0)
            ),
          ),
          hintText: "Rechercher...",
          filled: true,
          fillColor: Colors.white,
          prefixIcon: IconButton(
            icon: Icon(Icons.arrow_back, size: 20, color: primaryColor,),
            onPressed: (){
                  setState(() {
                    _isSearch = false;
                  });
                },
          )
        ),
      ),
    );
  }

  Future<void> AddForms(BuildContext context, ScaffoldKey) async {
    return await showDialog(context: context,
    builder:  (context){
      return FirstDialog(ScaffoldKey);
    });
  }


  void AddGroupeForm(BuildContext context, ScaffoldKey) async {
    return await showDialog(context: context,
        builder:  (context){
          return AddGroupeDialog(ScaffoldKey);
        });
  }

  @override
  void initState() {
    IkramUpdate();
    HamdiUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _mainKey = GlobalKey<ScaffoldState>();
    TextTheme textTheme = Theme.of(context).textTheme;


    void choiceMenu(IconTex choice){
      if (choice.TextnIcon.text==Liste_Menu[0]){
        AddGroupeForm(context, choice.Scaffoldkey);
      }else if (choice.TextnIcon.text==Liste_Menu[1]){
        print(Liste_Menu[0]);
      }else if (choice.TextnIcon.text==Liste_Menu[2]){
        print(Liste_Menu[2]);
      }
    }
    return SafeArea(
      child: DefaultTabController(
        length: _onglets.length,
        child: Scaffold(
          key: _mainKey,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: _isSearch==false ? Text(
              'Viste',
              style: TextStyle(
                color: thirdColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ) :
            _buildSearch(),
            backgroundColor: primaryColor,
            elevation: 0.0,
            bottom: TabBar(
              labelStyle: textTheme.headline2,
              tabs: [
                Tab(text: _onglets[0], icon: Icon(_icones[0])),
                Tab(text: _onglets[1], icon: Icon(_icones[1])),
                Tab(text: _onglets[2], icon: Icon(_icones[2])),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search, size: 27),
                onPressed: (){
                  setState(() {
                    _isSearch = true;
                  });
                },
              ),
              IconButton(
                icon:  Icon(Icons.notifications, size: 27),
                onPressed: (){},
              ),
              PopupMenuButton(
                onSelected: choiceMenu,
                itemBuilder: (BuildContext context){
                  return _MenuChoices.map((choice){
                    return PopupMenuItem(
                      value: IconTex(TextnIcon: choice, Scaffoldkey: _mainKey),
                      child: IconTex(TextnIcon: choice, Scaffoldkey: _mainKey),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          body: TabBarView(
            children: [
              CovoitPage(),
              ColocPage(),
              GroupesPage(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
                Icons.add,
                size: 35,
            ),
            onPressed: () async {
              await AddForms(context, _mainKey);
            },
          ),
        ),
      ),
    );

  }
}