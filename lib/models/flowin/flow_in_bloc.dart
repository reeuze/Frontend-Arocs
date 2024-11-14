import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'flow_in_model.dart';

part 'flow_in_event.dart';
part 'flow_in_state.dart';

class FlowInBloc extends Bloc<FlowInEvent, FlowInState> {
  List<FlowInModel> flowIns = [
    FlowInModel(flowInUID: const Uuid().v4(), flowInQuantity: 20, totalQuantity: 30, flowInDate: DateTime.now(), flowInStatus: FlowInStatus.waiting),
    FlowInModel(flowInUID: const Uuid().v4(), flowInQuantity: 20, totalQuantity: 30, flowInDate: DateTime.now(), flowInStatus: FlowInStatus.waiting),
    FlowInModel(flowInUID: const Uuid().v4(), flowInQuantity: 20, totalQuantity: 30, flowInDate: DateTime.now(), flowInStatus: FlowInStatus.done),
    FlowInModel(flowInUID: const Uuid().v4(), flowInQuantity: 20, totalQuantity: 30, flowInDate: DateTime.now(), flowInStatus: FlowInStatus.ongoing),
    FlowInModel(flowInUID: const Uuid().v4(), flowInQuantity: 20, totalQuantity: 30, flowInDate: DateTime.now(), flowInStatus: FlowInStatus.ongoing),
  ];

  FlowInBloc() : super(FlowInInitial()) {

    // ===== Template ======
    on<FlowInEvent>((event, emit) {
    });


    // ===== Get =====
    on<FlowInLoadingEvent>((event, emit) {
      emit(FlowInLoading());
      // do something
      emit(FlowInLoaded(flowIns: flowIns));
    });


    // ===== Creation =====
    on<FlowInCreationEvent>((event, emit) {
      emit(FlowInLoading());
      List<FlowInModel> updatedFlowIn = List.from(flowIns);
      updatedFlowIn.add(event.newFlowIn);
      flowIns = updatedFlowIn;
      emit(FlowInLoaded(flowIns: updatedFlowIn));
    });

  }
}