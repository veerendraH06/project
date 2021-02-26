import 'dart:async';
import 'package:YOURDRS_FlutterAPP/blocs/doctors_event.dart';
import 'package:YOURDRS_FlutterAPP/network/models/appointment.dart';
import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';

import 'base_class/base_bloc.dart';
import 'doctors_abstractbloc.dart';



class PatientBloc extends BaseBloc<PatientAppointmentBlocEvent, PatientAppointmentBlocState> {
  PatientBloc() : super(PatientAppointmentBlocState.initial());

  @override
  Stream<PatientAppointmentBlocState> mapEventToState(
      PatientAppointmentBlocEvent event) async* {
    print("mapEventToState=$event");

    if (event is GetPatientAppointmentBlocEvent) {
      yield state.copyWith(
        isLoading: true,
      );

      List<Patient> users;
      users = await Services.getUsers();

      if (users == null || users.isEmpty) {
        yield state.copyWith(
            isLoading: false, errorMsg: 'No patients available', users: users);
      } else {
        yield state.copyWith(isLoading: false, errorMsg: null, users: users);
      }
    }

    if (event is SearchPatientEvent) {
      yield state.copyWith(keyword: event.keyword);
    }
  }
}
