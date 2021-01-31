import 'package:flutter/material.dart';
import 'package:viste/shared/constants.dart';
import 'package:viste/models/CovoitModel.dart';
import 'package:viste/models/ColocModel.dart';
import 'package:viste/models/UserModel.dart';
import 'package:viste/models/GroupModels.dart';

// EXEMPLES

// HAMDI USER
final String status='Offre';
final String FromCity='Agadir';
final String ToCity='Kheribga';
final String Date='07/12';
final String FromTime='00:33';
final String ToTime='10:20';
final String DatePubli = '08:00';
final String OrgTravail = 'Assystem';

final String Nom='BenT';
final String Prenom='Hamdi';
final String Sexe=Liste_Sexe[0];
final String Ecole=Liste_Ecoles[1];
final DateTime DateNaissance = DateTime(1990,8,12);
final String Filiere= Liste_Filieres[Liste_Ecoles[1]][0];
final DateTime Promo=DateTime(2016);
final String Groupe=Liste_Groupes[Liste_Ecoles[1]][0];
final String Email='MyEmail@gmail.com';


List<CovoitModel> CovoitList = [CovoitModel(
    status: status,
    Date: Date,
    FromCity: FromCity,
    ToCity: ToCity,
    FromTime: FromTime,
    ToTime: ToTime,
    DatePubli: DatePubli
),];
List<ColocModel> ColocList = [ColocModel(
  status: status,
  ville: 'Fès',
  quartier: 'Medina Qdima',
  budget: '2000',
  DatePubli: DatePubli
),];

List<MsgGroupeModel> msgGroupe = [MsgGroupeModel(
  Objet: 'Réunion AMEIGR',
  Content: 'Content du msg Content du msg Content du msg Content du msg Content du msg',
  DatePubli: DatePubli
),];

List<GroupeModel> Group0 = [];


UserModel Hamdi = UserModel();
//     Nom: Nom,
//     Prenom: Prenom,
//     Sexe: Sexe,
//     Ecole: Ecole,
//     DateNaissance: DateNaissance,
//     Filiere: Filiere,
//     Promo: Promo,
//     Groupes: Group0,
//     Email: Email,
//     Colocs: ColocList,
//     Covoits: CovoitList,
//     OrgTravail: OrgTravail
// );
// IKRAM USER

final String status2='Demande';
final String FromCity2='Rabat';
final String ToCity2='Temra';
final String FromTime2='12:00';
final String ToTime2='13:00';
final String Date2='17/03';
final String DatePubli2 = '22:00';
final String OrgTravail2 = 'Ministère Eau';

final String Nom2='Ikram';
final String Prenom2='Benchbani';
final String Sexe2=Liste_Sexe[1];
final String Ecole2=Liste_Ecoles[0];
final DateTime DateNaissance2 = DateTime(1990,8,12);
final String Filiere2= Liste_Filieres[Ecole2][0];
final DateTime Promo2=DateTime(2015);
final String Groupe2=Liste_Groupes[Ecole2][0];
final String Email2='MyEmail2@gmail.com';
List<CovoitModel> CovoitList2 = [CovoitModel(
    Date: Date2,
    status: status2,
    FromCity: FromCity2,
    ToCity: ToCity2,
    FromTime: FromTime2,
    ToTime: ToTime2,
    DatePubli: DatePubli2
),];
List<ColocModel> ColocList2 = [ColocModel(
  status: status2,
  ville: 'Rabat',
  quartier: 'Rabat Ville',
  budget: '3000',
  DatePubli: DatePubli2
),];
List<MsgGroupeModel> msgGroupe2 = [MsgGroupeModel(
  Objet: 'Réunion REPORT',
  Content: 'REPORT DE GUENOUNI REPORT DE GUENOUNI REPORT DE GUENOUNI REPORT DE GUENOUNI REPORT DE GUENOUNI REPORT DE GUENOUNI',
  DatePubli: DatePubli2,
),];
//
UserModel Ikram = UserModel();

void IkramUpdate(){
  Ikram.Sexe=Sexe2;
  Ikram.Ecole = Ecole2;
  Ikram.Colocs = ColocList2;
  Ikram.Groupes = Group0;
  Ikram.Covoits = CovoitList2;
}

void HamdiUpdate(){
  Hamdi.Sexe=Sexe;
  Hamdi.Ecole = Ecole;
  Hamdi.Colocs = ColocList;
  Hamdi.Groupes = Group0;
  Hamdi.Covoits = CovoitList;
}






// Sexe: Sexe2,
// Ecole: Ecole2,
// DateNaissance: DateNaissance2,
// Filiere: Filiere2,
// Promo: Promo2,
// Groupes: Group0 ,
// Email: Email2,
// Colocs: ColocList2,
// Covoits: CovoitList2,
// OrgTravail: OrgTravail2


GroupeModel AMEIGR= GroupeModel(
  President: Hamdi,
  Membres: [Hamdi, Ikram],
  Nom: 'AMEIGR',
  Content: msgGroupe,
);

GroupeModel GR= GroupeModel(
  President: Ikram,
  Membres: [Hamdi, Ikram],
  Nom: 'GR2016',
  Content: msgGroupe2,
);




