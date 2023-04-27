import 'package:dio/dio.dart';

Future login(String login, String password) async {
  /// More examples see https://github.com/cfug/dio/blob/main/example
  int index = -1;
  final dio = Dio();
  final response = await dio.post(
      'https://cubecesi.000webhostapp.com/index.php',
      data: FormData.fromMap(
          {'fonction': 'login', 'login': login, 'password': password}));
  List rep_requete = response.data;
  return rep_requete;
}

Future inscription(
    String login,
    String password,
    String nom,
    String prenom,
    String pseudo,
    String datedenaissance,
    String telephone,
    String ville,
    String codepostal,
    String adresse,
    // String Languechoix,
    String RGPD,
    int genre) async {
  final dio = Dio();
  final response =
      await dio.post('https://cubecesi.000webhostapp.com/index.php',
          data: FormData.fromMap({
            'fonction': 'inscription',
            'login': login,
            'password': password,
            'nom': nom,
            'prenom': prenom,
            'pseudo': pseudo,
            'datedenaissance': datedenaissance,
            'telephone': telephone,
            'languechoix': "Français",
            'ville': ville,
            'codepostal': codepostal,
            'adresse': adresse,
            'datergpd': RGPD,
            'typeutilisateur': 1,
            'sexe': genre
          }));
  return response.data;
}

Future addmessage(int expediteur, int recepteur, String titre, String texte,
    String image, String datetime) async {
  final dio = Dio();
  final response =
      await dio.post('https://cubecesi.000webhostapp.com/index.php',
          data: FormData.fromMap({
            'fonction': 'addmessage',
            'expediteur': expediteur,
            'recepteur': recepteur,
            'date': datetime,
            'texte': texte,
            'titre': titre,
            'image': image,
          }));
  return response.data;
}

Future<List> getmessages() async {
  final dio = Dio();
  final response = await dio.post(
      'https://cubecesi.000webhostapp.com/index.php',
      data: FormData.fromMap({'fonction': 'getmessage'}));
  List rep_requete = response.data;
  return rep_requete;
}

Future addfavoris(String idutilisateur, String idressource) async {
  final dio = Dio();
  final response =
      await dio.post('https://cubecesi.000webhostapp.com/index.php',
          data: FormData.fromMap({
            'fonction': 'addfavoris',
            'idutilisateur': idutilisateur,
            'idressource': idressource,
          }));
  return response.data;
}

Future suppfavoris(String idutilisateur, String idressource) async {
  final dio = Dio();
  final response =
      await dio.post('https://cubecesi.000webhostapp.com/index.php',
          data: FormData.fromMap({
            'fonction': 'suppfavoris',
            'idutilisateur': idutilisateur,
            'idressource': idressource,
          }));
  return response.data;
}

Future<List> getfavoris(String idutilisateur) async {
  final dio = Dio();
  final response =
      await dio.post('https://cubecesi.000webhostapp.com/index.php',
          data: FormData.fromMap({
            'fonction': 'getfavoris',
            'idutilisateur': idutilisateur,
          }));
  List rep_requete = response.data;
  return rep_requete;
}
