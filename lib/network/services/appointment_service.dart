import 'dart:convert';
import 'package:YOURDRS_FlutterAPP/network/models/appointment.dart';
import 'package:http/http.dart' as http;

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<Patient>> getUsers() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Patient> list = parseUsers(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Patient> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Patient>((json) => Patient.fromJson(json)).toList();
  }
}
