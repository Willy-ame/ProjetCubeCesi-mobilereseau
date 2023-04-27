import 'package:flutter/material.dart';
import '../controllers/bdd_controller.dart';
import '../vue/inscription.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _pseudoController = TextEditingController();
  final _datenaissanceController = TextEditingController();
  final _addressController = TextEditingController();
  final _telephoneController = TextEditingController();
  // final _langagechoixController = TextEditingController();
  final _villeController = TextEditingController();
  final _codepostalController = TextEditingController();
  final _genreController = TextEditingController();
  List<String> _genres = ['Homme', 'Femme', 'Autre'];
  int _selectedIndex = 0;
  bool _acceptedRGPD = false;

  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _datenaissanceController.text = _dateFormatter.format(_selectedDate);
      });
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bravo !!!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Inscription reussi !'),
                // Text('Inscription reussi'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            // TextButton(
            //   child: Text('Retour'),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            SizedBox(height: 16.0),
            TextFormField(
              controller: _loginController,
              decoration: InputDecoration(
                labelText: 'identifiant',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre identifiant';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre Mot de passe';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Nom',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre nom';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'Prénom',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre prénom';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _pseudoController,
              decoration: InputDecoration(
                labelText: 'Pseudo',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre Pseudo';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              child: TextFormField(
                controller: _datenaissanceController,
                onTap: () {
                  _selectDate(context);
                },
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Date de naissance',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre Date de naissance';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _telephoneController,
              decoration: InputDecoration(
                labelText: 'Telephone',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre Telephone';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Adresse',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre adresse';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _villeController,
              decoration: InputDecoration(
                labelText: 'Ville',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre Ville';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _codepostalController,
              decoration: InputDecoration(
                labelText: 'Code postal',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre Code postal';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _genreController,
              decoration: InputDecoration(
                labelText: 'Genre',
              ),
              readOnly: true,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext builder) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: ListView.builder(
                        itemCount: _genres.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(_genres[index]),
                            onTap: () {
                              setState(() {
                                _selectedIndex = index + 1;
                                _genreController.text = _genres[index];
                              });
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('J\'accepte la norme RGPD'),
              value: _acceptedRGPD,
              onChanged: (bool? value) {
                setState(() {
                  _acceptedRGPD = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            if (_acceptedRGPD == false)
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Veuillez accepter la norme RGPD pour continuer.',
                  style: TextStyle(
                    color: Color.fromARGB(255, 169, 11, 0),
                    fontSize: 12,
                  ),
                ),
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('S\'inscrire'),
              onPressed: () {
                if (_formKey.currentState!.validate() && _acceptedRGPD) {
                  // Enregistrer les données
                  String login = _loginController.text;
                  String password = _passwordController.text;
                  String prenom = _firstNameController.text;
                  String nom = _lastNameController.text;
                  String pseudo = _pseudoController.text;
                  String datedenaissance = _datenaissanceController.text;
                  String tel = _telephoneController.text;
                  // String langue = _langagechoixController.text;
                  String ville = _villeController.text;
                  String codepostal = _codepostalController.text;
                  String adresse = _addressController.text;
                  String datergpd =
                      '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}';
                  // Envoyer les données à une base de données ou à un serveur
                  inscription(
                          login,
                          password,
                          nom,
                          prenom,
                          pseudo,
                          datedenaissance,
                          tel,
                          // langue,
                          ville,
                          codepostal,
                          adresse,
                          datergpd,
                          _selectedIndex)
                      .then(
                    (value) {
                      setState(() {
                        _showMyDialog();
                      });
                    },
                  );
                  // inscription();
                } else {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
