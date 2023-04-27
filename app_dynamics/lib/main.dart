import 'package:App_dynamics/vue/consultation.dart';
import 'package:flutter/material.dart';
import 'model/Widget_bouton.dart';
import 'vue/authentification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'vue/createressource.dart';

import 'package:dart_code_metrics/analyzer_plugin.dart';
import 'package:dart_code_metrics/cli_runner.dart';
import 'package:dart_code_metrics/config.dart';
import 'package:dart_code_metrics/lint_analyzer.dart';
import 'package:dart_code_metrics/reporters.dart';
import 'package:dart_code_metrics/unnecessary_nullable_analyzer.dart';
import 'package:dart_code_metrics/unused_code_analyzer.dart';
import 'package:dart_code_metrics/unused_files_analyzer.dart';
import 'package:dart_code_metrics/unused_l10n_analyzer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App_dynamics',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const MyHomePage(
          title: 'Accueil',
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: non_constant_identifier_names
  List v_index = [];

  void _PageLogin() async {
    final a = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
    setState(() {
      if (a != null) {
        v_index = a;
      }
    });
  }

  void _PageCreerressource() async {
    final a = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CreatemessagePage(v_index[0]["Id_utilisateur"])));
    // setState(() {
    //   if (a != null) {
    //     v_index = a;
    //   }
    // });
  }

  void _PageConsulationmessages() async {
    final a = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => Consultationmessages(v_index)));
    ;
    // setState(() {
    //   if (a != null) {
    //     v_index = a;
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            // automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 152, 158, 152),
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Image.asset("assets/images/Rectangle_logo.png")),
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            if (v_index.isNotEmpty) {
                              v_index = [];
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          super.widget));
                            } else
                              _PageLogin();
                          },
                          icon: v_index.isNotEmpty
                              ? Text("Bonjour " + v_index[0]["Nom"])
                              // ? Image.asset("assets/img/logo.png")
                              : const Icon(Icons.account_circle, size: 60),
                        ),
                        v_index.isNotEmpty
                            ? Text("Déconnexion")
                            : Text("Connexion"),
                      ],
                    ))
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
                height: 300,
                child: Stack(children: [
                  Positioned.fill(
                      child: Image.asset(
                    opacity: const AlwaysStoppedAnimation(1),
                    "assets/images/people.png",
                    fit: BoxFit.cover,
                  )),
                  Container(
                    color: const Color.fromARGB(90, 0, 0, 0),
                  ),
                  Center(
                    child: Text("CE QUI NOUS UNIT",
                        style: GoogleFonts.tomorrow(
                          textStyle: const TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        )),
                  )
                ])),
            Container(
              color: const Color.fromARGB(180, 147, 147, 147),
              height: 350, // largeur du container
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      CustomButton(
                        text: "Consulter les ressources",
                        onPressed: () {
                          _PageConsulationmessages();
                        },
                        monicon: Icons.checklist,
                        // monicon: Icons.send,
                        // monicon: Icons.list,
                      ),
                      if (v_index.isNotEmpty &&
                          v_index[0]["Id_utilisateur"] != "")
                        CustomButton(
                          text: "Catalogue des ressources",
                          onPressed: () {},
                          monicon: Icons.library_books,
                        ),
                    ],
                  ),
                  if (v_index.isNotEmpty && v_index[0]["Id_utilisateur"] != "")
                    Row(
                      children: [
                        CustomButton(
                          text: "Création et partage",
                          onPressed: () {
                            _PageCreerressource();
                          },
                          monicon: Icons.create,
                        ),
                        CustomButton(
                          text: "Statistiques",
                          onPressed: () {},
                          monicon: Icons.analytics,
                        )
                      ],
                    ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(200, 222, 222, 222),
              height: 150,
              child: Row(children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/msdls.png",
                      width: 100,
                      height: 100,
                    )),
                const Expanded(
                    child: Text(
                  "Copyright© 2020 - 2023. Tous droits réservés.",
                  textAlign: TextAlign.center,
                )),
                const Expanded(
                    child: Text(
                        "Politique de confidentialité |  Gestions des cookies | Conditons générales d’utilisation",
                        textAlign: TextAlign.left))
              ]),
            ),
          ],
        )));
  }
}
