import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'inventory_model.dart';

part 'inventory_state.dart';
part 'inventory_event.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  List<InventoryModel> items = [];

  InventoryBloc() : super(InventoryInitial()) {
    
    // ===== Template =====
    on<InventoryEvent>((event, emit) {
      
    });


    // ===== Loading =====
    on<InventoryLoadingEvent>((event, emit) {
      emit(InventoryLoading());

      emit(InventoryLoaded(items: items));
    });


    // ===== Creation =====
    on<InventoryCreationEvent>((event, emit) {
      emit(InventoryLoading());
      List<InventoryModel> updatedItems = List.from(items);
      updatedItems.add(event.newItem);
      items = updatedItems;
      emit(InventoryLoaded(items: updatedItems));
    });


    // ===== Update =====
    on<InventoryIncrementEvent>((event, emit) {
      emit(InventoryLoading());
      List<InventoryModel> updatedItems = List.from(items);
      updatedItems[event.index] = updatedItems[event.index].copyWith(itemCount: updatedItems[event.index].itemCount + event.count);
      items = updatedItems;
      emit(InventoryLoaded(items: updatedItems));
    });

    on<InventoryDecrementEvent>((event, emit) {
      emit(InventoryLoading());
      List<InventoryModel> updatedItems = List.from(items);
      updatedItems[event.index] = updatedItems[event.index].copyWith(itemCount: updatedItems[event.index].itemCount - event.count);
      items = updatedItems;
      emit(InventoryLoaded(items: updatedItems));
    });


    // ===== Deletion =====
    on<InventoryDeletionEvent>((event, emit) {
      emit(InventoryLoading());
      List<InventoryModel> updatedItems = List.from(items);
      updatedItems.removeAt(event.index);
      items = updatedItems;
      emit(InventoryLoaded(items: updatedItems));
    });

  }
}

