import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:translate_application/login_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();
  var output;
  String? dropdownValue;

  static const Map<String, String> lang = {
    "Hindi": "hi",
    "English": "en",
    "Urdu": "ur",
    "French": "fr",
    "Spanish": "es"
  };

  void trans() {
    translator
        .translate(textEditingController.text, to: "$dropdownValue")
        .then((value) {
      setState(() {
        output = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Multi Language Translator"),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                style: TextStyle(fontSize: 24),
                controller: textEditingController,
                onTap: () {
                  trans();
                },
                decoration: InputDecoration(
                    labelText: 'Type Here',
                    labelStyle: TextStyle(fontSize: 15)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Select Language here =>"),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      trans();
                    });
                  },
                  items: lang
                      .map((string, value) {
                        return MapEntry(
                          string,
                          DropdownMenuItem<String>(
                            value: value,
                            child: Text(string),
                          ),
                        );
                      })
                      .values
                      .toList(),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text('Translated Text'),
            SizedBox(
              height: 10,
            ),
            Text(
              output == null ? "Please Select Language" : output.toString(),
              style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 50,),
            RawMaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                });
              },
              fillColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),

              ),
              child: const Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ));
  }
}