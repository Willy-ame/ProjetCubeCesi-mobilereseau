import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 152, 158, 152),
            flexibleSpace: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Image.asset("assets/images/Rectangle_logo.png")),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            print("azeza");
                          },
                          icon: Icon(Icons.account_circle, size: 60),
                        ),
                        Text("Connexion")
                      ],
                    ))
              ],
            ),
          ),
        ),
        body: Container());
  }
}
