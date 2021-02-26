import 'package:YOURDRS_FlutterAPP/blocs/doctors_bloc.dart';
import 'package:YOURDRS_FlutterAPP/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:BlocProvider<PatientBloc>(
        create: (context) => PatientBloc(),
    child: PatientAppointment(),
    ),
    );    // PatientAppointment());
  }
}
