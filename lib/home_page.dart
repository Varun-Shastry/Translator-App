// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:translator/translator.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GoogleTranslator translator = GoogleTranslator();
    final inputController = TextEditingController();
    var output;
    String? dropdownValue;

    Map<String, String> lang = {
    "Hindi": "hi",
    "English": "en",
    "Urdu": "ur",
  };

  void trans() {
    translator
        .translate(inputController.text, to: "$dropdownValue")
        .then((value) {
      setState(() {
        output = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
        'Translate',
         style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
         ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            SizedBox(height: 30,),
            
            Text('To'),
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
            SizedBox(height: 10,),
            SizedBox(
              height: h * 0.2,
              child: TextField(
                maxLines: 5,
                maxLength: 500,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter text',
                  contentPadding: EdgeInsets.only(bottom: 40)
                ),

              ),
            ),

            RawMaterialButton(
                    onPressed: () {


                    },
                    fillColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),

                    ),
                    child: const Text(
                      'Translate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
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

          ],
        ),
      ),
    );
  }
}

