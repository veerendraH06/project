import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Patients extends StatefulWidget {
  @override
  _DictationState createState() => _DictationState();
}

class _DictationState extends State<Patients> {

  var _currentSelectedValue;
  final String url = "https://jsonplaceholder.typicode.com/users"; ///Api data

  List data = List(); ///edited line

  Future<String> getfilterdData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});  /// getting data from Api
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody;
    });

    print(resBody);

    return "Success";
  }

  @override
  void initState() {
    super.initState();
    this.getfilterdData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 20),
            child: Container(
                height: 55,
                width: 250,
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      isEmpty: _currentSelectedValue == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text("Patients"),
                          value: _currentSelectedValue,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _currentSelectedValue = newValue;
                              state.didChange(newValue);
                              print(newValue);
                            });
                          },
                          ///
                          /// showing data from list format
                          items: data.map((item) {
                            return DropdownMenuItem<String>(
                              child: new Text(item['id'].toString()),
                              value: item['name'],
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}