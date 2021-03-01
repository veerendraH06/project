
import 'package:YOURDRS_FlutterAPP/blocs/base_class/base_bloc_event.dart';
import 'package:flutter/widgets.dart';

abstract class PatientAppointmentBlocEvent extends BaseBlocEvent {}

class GetPatientAppointmentBlocEvent extends PatientAppointmentBlocEvent {
  @override
  List<Object> get props => [];
}


/// SearchPatient Event
class SearchPatientEvent extends PatientAppointmentBlocEvent {
  final String keyword;

  SearchPatientEvent({@required this.keyword});

  @override
  List<Object> get props => [this.keyword];
}



/// FilterPatient Event
class FilterPatientEvent extends PatientAppointmentBlocEvent{
  final String users;

  FilterPatientEvent({@required this.users});

  @override
  List<Object> get props =>[this.users];
}