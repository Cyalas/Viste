import 'package:flutter/material.dart';

// Colors
Color primaryColor =Colors.blueGrey;
Color secondaryColor = Colors.blueGrey[900];
Color thirdColor = Colors.white;

LinearGradient LinearG = LinearGradient(
  colors: [
    primaryColor, primaryColor, primaryColor, Color(0xff1F1F1F)
  ],

);
// Color fourthColor = Colors.white60;

List<String> Liste_Sexe = ['Homme','Femme'];
List<String> Liste_Status = ['Offre','Demande'];
List<int> Liste_Promo = [for(var yr=1960; yr<2023; yr+=1) yr];
List<String> Liste_Villes = ['Rabat', 'Casablanca', 'Agadir', 'Meknès', 'Dakhla', 'Fès', 'Marrakech', 'Temara'];
List<String> Liste_Mois = ['Janvier', 'Février', 'Mars','Avril','Mai','Juin','Juillet','Août','Septembre','Novembre','Décembre'];
List<int> Liste_Annees = [for(var yr=1920; yr<2020;yr+=1) yr];
// Liste<String> Liste_Jours = [];

// MENU
List<String> Liste_Menu=['Créer un groupe','Paramètres', 'Nous contacter','Déconnexion'];

// ECOLES
List <String> Liste_Ecoles = ['IAV Hassan II', 'ENAM'];

// FILIERES
List<String> List_Filieres_IAV = ['Agronomie','Topographie','Génie Rural','Vétérinaire',
  'Industrie Agro-Alimentaire','Horticulture','Halieutique'];
List<String> List_Filieres_ENAM = ['Arboriculture Fruitière, Oléiculture et Viticulture',  'Ingénierie de Développement Rural',
  'Protection des Plantes et Environnement','Ingénierie Agro-Economique',
  'Productions Animales et Pastoralisme','Sciences et Techniques des Productions Végétales'];

// Groupes
List<String> List_Groupes_IAV = ['IAV BDE', 'AMEIGR', 'AMEIA', 'AMEVET', 'AMETOP'];
List<String> List_Groupes_ENAM = ['G1', 'G2', 'G3', 'G4'];

// Maps
Map Liste_Filieres = {
  Liste_Ecoles[0]: List_Filieres_IAV,
  Liste_Ecoles[1]: List_Filieres_ENAM,
};
Map Liste_Groupes = {
  Liste_Ecoles[0]: List_Groupes_IAV,
  Liste_Ecoles[1]: List_Groupes_ENAM,
};

// ICONS
Map Icons_paths ={
  'Viste': 'assets/viste.png',
  Liste_Sexe[0]: 'assets/man.png',
  Liste_Sexe[1]: 'assets/woman.png',
  Liste_Ecoles[0]: 'assets/Logo_iav.png',
  Liste_Ecoles[1]: 'assets/Logo_enam.png'
};


// ALERTES
String Alerte_registration = "Votre inscription sera validée par votre promo."
    " Un mail de confirmation vous serait envoyé.";
String Alerte_covoit_envoye = "Votre demande de Covoit a été envoyée!";
String Alerte_coloc_envoye = "Votre demande de Coloc a été envoyée!";
String Alerte_msg_envoye = "Votre message a été envoyé!";
String Alerte_creation_groupe = "Votre groupe a été créé! Invitez les gens à rejoindre votre groupe. Consultez paramètres pour plus d'infos.";