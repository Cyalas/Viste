import 'package:viste/models/CovoitModel.dart';
import 'package:viste/models/ColocModel.dart';
import 'package:viste/models/GroupModels.dart';

class UserModel{
  final String Nom;
  final String Prenom;
  final String Sexe;
  final String Ecole;
  String OrgTravail;
  final DateTime DateNaissance ;
  final String Filiere;
  final DateTime Promo;
  String Email;
  List<CovoitModel> Covoits;
  List<ColocModel> Colocs;
  List<GroupeModel> Groupes;

  UserModel({this.Nom, this.Prenom, this.Sexe, this.Ecole, this.OrgTravail, this.DateNaissance,
    this.Filiere,this.Promo, this.Groupes, this.Email, this.Covoits, this.Colocs});
}
