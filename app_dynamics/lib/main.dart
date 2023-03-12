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
          preferredSize: const Size.fromHeight(300),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 152, 158, 152),
            leading: Image.asset("assets/images/Rectangle_logo.png"),
            leadingWidth: 250,
            actions: [
              Column(
                children: [
                  Container(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.account_circle,
                            size: 50,
                          ))),
                  Container(
                    child: Text("Connexion"),
                  )
                ],
              )
            ],
          ),
        ),
        body: Container());
  }
}
