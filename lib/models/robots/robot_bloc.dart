import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:uuid/uuid.dart';

import 'robot_model.dart';

part 'robot_event.dart';
part 'robot_state.dart';

class RobotBloc extends Bloc<RobotEvent, RobotState> {
  List<RobotModel> robots = [
    RobotModel(robotUid: const Uuid().v4(), robotStatus: RobotStatus.ready),
    RobotModel(robotUid: const Uuid().v4(), robotStatus: RobotStatus.unavailable),
    RobotModel(robotUid: const Uuid().v4(), robotStatus: RobotStatus.working)
  ];

  RobotBloc() : super(RobotInitial()) {
    
    // ===== Template =====
    on<RobotEvent>((event, emit) {

    });


    // ===== Get =====
    on<RobotLoadingEvent>((event, emit) {
      emit(RobotLoading());

      emit(RobotLoaded(robots: robots));
    });

    
  }
}