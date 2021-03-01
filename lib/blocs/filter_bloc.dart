
import 'dart:async';

import 'package:YOURDRS_FlutterAPP/blocs/base_class/base_bloc.dart';
import 'package:YOURDRS_FlutterAPP/blocs/doctors_abstractbloc.dart';
import 'package:YOURDRS_FlutterAPP/blocs/doctors_event.dart';
import 'package:YOURDRS_FlutterAPP/network/models/appointment.dart';
import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';

class FilterdBloc extends BaseBloc<PatientAppointmentBlocEvent, PatientAppointmentBlocState> {
  FilterdBloc(PatientAppointmentBlocState initialState) : super(initialState);

  Stream<PatientAppointmentBlocState> mapEventToState(
      PatientAppointmentBlocEvent event) async* {
    print("mapEventToState=$event");

    if (event is GetPatientAppointmentBlocEvent) {
      yield state.copyWith(isLoading: true);

      List<Patient> users;
      users = await Services.getUsers();
      if (users == null) {
        yield state.copyWith(isLoading: false,
            errorMsg: "No filter Data available",
            users: users);
      }
      else {
        yield state.copyWith(isLoading: false, errorMsg: "null", users: users);
      }
    }

  }

}
