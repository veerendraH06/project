import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Dictation extends StatefulWidget {
  @override
  _DictationState createState() => _DictationState();
}

class _DictationState extends State<Dictation> {
  var _currentSelectedValue;
  final String url = "https://jsonplaceholder.typicode.com/users";

  List data = List(); //edited line

  Future<String> getSWData() async {
    var res = await http.get(Uri.encodeFull(url),);
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody;
    });

    print(resBody);
    print("Value displayed");

    return "Success";
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
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
                              borderRadius: BorderRadius.circular(5.0),
                          ),
                      ),
                      isEmpty: _currentSelectedValue == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text("Provider"),
                          value: _currentSelectedValue,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _currentSelectedValue = newValue;
                              state.didChange(newValue);
                              print(newValue);
                            });
                          },
                          items: data.map((item) {
                            return DropdownMenuItem<String>(
                              child: new Text(item['name']),
                              value: item['id'].toString(),
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