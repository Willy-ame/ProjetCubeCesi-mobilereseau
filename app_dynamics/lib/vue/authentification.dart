import 'package:flutter/material.dart';
import '../controllers/bdd_controller.dart';
import '../vue/inscription.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscure = true;
  String vstr_affichemessage = "";

  void _PageRetour(List tab) {
    Navigator.pop(context, tab);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 235, 235, 235),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 152, 158, 152),
              title: const Text("Page d'authentification"),
              centerTitle: true,
            ),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(27),
                        child: Image.asset(
                          "assets/images/shield.png",
                          height: 130,
                          width: 200,
                        )),
                    TextField(
                      controller: userController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Identifiant',
                        prefixIcon: Icon(
                          Icons.person,
                          // color: Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      obscureText: obscure,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "Mot de passe",
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            icon: obscure
                                ? const Icon(Icons.visibility_off,
                                    color: Color.fromARGB(146, 1, 1, 1))
                                : const Icon(Icons.visibility_sharp,
                                    color: Color.fromARGB(146, 1, 1, 1)),
                          )),
                    ),
                    const SizedBox(height: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Mot de passe oublié",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 200, 255)),
                          ))
                    ]),
                    const SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            login(userController.text, passwordController.text)
                                .then((value) {
                              setState(() {
                                List tableau = value;
                                if (tableau.isNotEmpty) {
                                  _PageRetour(tableau);
                                } else {
                                  vstr_affichemessage =
                                      "Login ou mot de passe incorrect";
                                  FocusScope.of(context).unfocus();
                                }
                              });
                            });
                          },
                          child: const Text("Login"),
                        )),
                    const SizedBox(height: 15),
                    Text(
                      textAlign: TextAlign.start,
                      vstr_affichemessage,
                      style: const TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 255, 0, 0)),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Vous n'avez pas de compte ?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                            child: const Text(
                              "S'inscrire ici",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 200, 255)),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
