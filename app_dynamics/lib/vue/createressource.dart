import 'dart:convert';

import 'package:flutter/material.dart';
import '../controllers/bdd_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image/image.dart' as ImageProcess;

class CreatemessagePage extends StatefulWidget {
  final String _monutilisateur;
  CreatemessagePage(this._monutilisateur);

  @override
  _CreatemessagePageState createState() => _CreatemessagePageState();
}

class _CreatemessagePageState extends State<CreatemessagePage> {
  String getutilisateur() => widget._monutilisateur;
  final _formKey = GlobalKey<FormState>();

  final _messageController = TextEditingController();
  final _titreController = TextEditingController();
  final _senderController = TextEditingController();

  File? _image;
  final _picker = ImagePicker();
  String _base64Image = '';

  Future pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
      final _imageFile = ImageProcess.decodeImage(
        _image!.readAsBytesSync(),
      );
      final compressedImage = ImageProcess.copyResize(_imageFile!, width: 800);
      _base64Image = base64Encode(ImageProcess.encodePng(compressedImage));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Envoyer une ressource'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _senderController,
                decoration: InputDecoration(
                  labelText: 'Receveur',
                ),
                validator: (value) {
                  return null;
                },
              ),
              TextFormField(
                controller: _titreController,
                decoration: InputDecoration(
                  labelText: 'Titre',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un Titre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  labelText: 'Message',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un message';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              _image == null
                  ? ElevatedButton.icon(
                      onPressed: pickImage,
                      icon: Icon(Icons.image),
                      label: Text('Ajouter une image'),
                    )
                  : Image.file(_image!),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_senderController.text == "") {
                      _senderController.text = "0";
                    }
                    int _recepteur = int.parse(_senderController.text);
                    String _message = _messageController.text;
                    String _titre = _titreController.text;
                    String _date =
                        '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}';
                    addmessage(int.parse(getutilisateur()), _recepteur, _titre,
                        _message, _base64Image, _date);

                    Navigator.pop(context);
                  }
                },
                child: Text('Envoyer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
