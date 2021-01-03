import 'package:viste/models/UserModel.dart';
class GroupeModel{
  UserModel President;
  List<UserModel> Membres;
  String Nom;
  List<MsgGroupeModel> Content;

  GroupeModel({this.President, this.Membres, this.Nom, this.Content});
}


class MsgGroupeModel{
  final String Groupe;
  final String Objet;
  final String Content;
  String DatePubli;

 MsgGroupeModel({this.Groupe, this.Objet, this.Content, this.DatePubli});
}
