import 'package:viste/models/CovoitModel.dart';
import 'package:viste/models/ColocModel.dart';
import 'package:viste/models/GroupModels.dart';

class UserModel{
  String Id;
  String Nom;
  String Prenom;
  String Sexe;
  String Ecole;
  String OrgTravail;
  List<String> DateNaissance ; // [Année-Mois-Jour]
  String Filiere;
  int Promo;
  String Email;
  String Password;
  bool isAdmin;
  bool isModerator;

  // List<String> Covoits;
  // List<String> Colocs;
  // List<String> Groupes;
  List<CovoitModel> Covoits;
  List<ColocModel> Colocs;
  List<GroupeModel> Groupes;

}
