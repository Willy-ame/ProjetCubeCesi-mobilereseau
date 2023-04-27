import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:App_dynamics/controllers/bdd_controller.dart';

class Consultationmessages extends StatefulWidget {
  final List _monutilisateur;
  Consultationmessages(this._monutilisateur);
  @override
  _ConsultationmessagesPageState createState() =>
      _ConsultationmessagesPageState();
}

class _ConsultationmessagesPageState extends State<Consultationmessages> {
  List getutilisateur() => widget._monutilisateur;

  Widget decrypt(String base64Image) {
    Widget lewidget = Text("");
    if (base64Image != "") {
      final _byteImage = Base64Decoder().convert(base64Image);
      lewidget = Image.memory(_byteImage);
    }
    return lewidget;
  }

  List<bool> isLiked = [];

  // Future<List> favoris(String a) {
  //   return getfavoris(a);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Espace ressource'),
      ),
      body: FutureBuilder<List>(
        future: getmessages(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          //avant if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          if (snapshot.hasData) {
            // Les données ont été récupérées avec succès
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                // Si la liste isLiked n'a pas encore été remplie avec tous les index
                // jusqu'à l'index actuel, ajoutez de nouveaux éléments.
                if (isLiked.length <= index) {
                  isLiked.addAll(List.generate(
                      data.length - isLiked.length, (_) => false));
                }

                if (getutilisateur().isNotEmpty) {
                  getfavoris(getutilisateur()[0]['Id_utilisateur'])
                      .then((value) {
                    if (value.isNotEmpty) {
                      for (int i = 0; i < value.length; i++) {
                        if (data[index]["Id_ressource"] ==
                            value[i]["Id_ressource"]) {
                          isLiked[index] = true;
                        }
                      }
                    }
                  });
                }
                return Card(
                  margin: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: (null),
                          ),
                          SizedBox(width: 10),
                          Text(
                            data[index]['Nom'],
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 5),
                          Text(
                            data[index]['Prenom'],
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 180),
                          IconButton(
                            icon: isLiked[index]
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              if (isLiked[index] == false) {
                                addfavoris(
                                    getutilisateur()[0]['Id_utilisateur'],
                                    data[index]["Id_ressource"]);
                              } else
                                suppfavoris(
                                    getutilisateur()[0]['Id_utilisateur'],
                                    data[index]["Id_ressource"]);
                              setState(() {
                                isLiked[index] = !isLiked[index];
                              });
                            },
                          ),
                        ],
                      ),
                      Text(
                        data[index]['Titre_ressource'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        data[index]['Message'],
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      // Image.network(image,
                      //     width: double.infinity,
                      //     height: 200,
                      //     fit: BoxFit.cover),
                      decrypt(data[index]['Contenu_ressource']),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.thumb_up, size: 15),
                          SizedBox(width: 3),
                          Text(data[index]['Compteur_vues'].toString()),
                          SizedBox(width: 20),
                          Icon(Icons.comment, size: 15),
                          // SizedBox(width: 5),
                          // Text(data[index]['comments'].toString()),
                          SizedBox(width: 20),
                          // ElevatedButton.icon(
                          //   onPressed: () {},
                          //   icon: Icon(Icons.thumb_up),
                          //   label: Text('J\'aime'),
                          // ),
                          SizedBox(width: 10),
                          // ElevatedButton.icon(
                          //   onPressed: () {},
                          //   icon: Icon(Icons.comment),
                          //   label: Text('Commentaire'),
                          // ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            // Les données sont en cours de chargement ou n'ont pas encore été récupérées
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
