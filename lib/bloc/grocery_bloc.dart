import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:shopping_list/models/grocery_item.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  var grocery_box = Hive.box('grocery_box');
  GroceryBloc() : super(GroceryInitialState()) {
    on<AddDataEvent>(addDataEvent);
    on<DeleteDataEvent>(deleteDataEvent);
    on<ClearBoxEvent>(clearDataEvent);
  }

  FutureOr<void> addDataEvent(
      AddDataEvent event, Emitter<GroceryState> emit) async {
    try {
      checkbox();
      await grocery_box.put(event.item.id,event.item);
      debugPrint('${event.item.id}${event.item}');
      // debugPrint('this is the data entered----> $dataentry');
      emit(GroceryLoadedState(msg: 'Added Successfully'));
    } catch (error) {
      print('Error : ${error}');
    }
  }

  FutureOr<void> deleteDataEvent(
      DeleteDataEvent event, Emitter<GroceryState> emit) async {
    try {
      checkbox();
      grocery_box.delete(event.item.id);
      emit(GroceryDeletedState(msg: 'Deleted Successfully'));
    } catch (error) {
      print('Error : ${error}');
    }
  }

  FutureOr<void> clearDataEvent(
      ClearBoxEvent event, Emitter<GroceryState> emit) {
    grocery_box.clear();
    emit(GroceryClearedState(msg: 'Cleared all Data'));
  }
}

Future<void> checkbox() async {
  if (!Hive.isBoxOpen('grocery_box')) {
    await Hive.openBox('grocery_box');
  }
}
