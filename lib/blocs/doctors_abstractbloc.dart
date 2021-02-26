
import 'package:YOURDRS_FlutterAPP/blocs/base_class/base_bloc_event.dart';
import 'package:flutter/widgets.dart';

abstract class PatientAppointmentBlocEvent extends BaseBlocEvent {}

class GetPatientAppointmentBlocEvent extends PatientAppointmentBlocEvent {
  @override
  List<Object> get props => [];
}

class SearchPatientEvent extends PatientAppointmentBlocEvent {
  final String keyword;

  SearchPatientEvent({@required this.keyword});

  @override
  List<Object> get props => [this.keyword];
}
