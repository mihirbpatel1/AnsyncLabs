import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'grocery_event.dart';
import 'grocery_state.dart';
import '../models/grocery_item.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final SharedPreferences prefs;

  GroceryBloc({required this.prefs}) : super(GroceryInitial()) {
    on<LoadGroceries>(_onLoadGroceries);
    on<AddGrocery>(_onAddGrocery);
    on<UpdateGrocery>(_onUpdateGrocery);
    on<DeleteGrocery>(_onDeleteGrocery);
  }

  Future<void> _onLoadGroceries(
      LoadGroceries event, Emitter<GroceryState> emit) async {
    try {
      final jsonString = prefs.getString('groceries') ?? '[]';
      final List<dynamic> jsonList = json.decode(jsonString);
      final groceries =
          jsonList.map((json) => GroceryItem.fromJson(json)).toList();
      emit(GroceriesLoaded(groceries));
    } catch (_) {
      emit(GroceryError("Failed to load groceries."));
    }
  }

  void _onAddGrocery(AddGrocery event, Emitter<GroceryState> emit) {
    final currentState = state;
    if (currentState is GroceriesLoaded) {
      final updatedList = List<GroceryItem>.from(currentState.groceries)
        ..add(event.item);
      emit(GroceriesLoaded(updatedList));
      _saveToPrefs(updatedList);
    }
  }

  void _onUpdateGrocery(UpdateGrocery event, Emitter<GroceryState> emit) {
    final currentState = state;
    if (currentState is GroceriesLoaded) {
      final updatedList = currentState.groceries.map((item) {
        return item.id == event.item.id ? event.item : item;
      }).toList();
      emit(GroceriesLoaded(updatedList));
      _saveToPrefs(updatedList);
    }
  }

  void _onDeleteGrocery(DeleteGrocery event, Emitter<GroceryState> emit) {
    final currentState = state;
    if (currentState is GroceriesLoaded) {
      final updatedList =
          currentState.groceries.where((item) => item.id != event.id).toList();
      emit(GroceriesLoaded(updatedList));
      _saveToPrefs(updatedList);
    }
  }

  void _saveToPrefs(List<GroceryItem> groceries) {
    final jsonString =
        json.encode(groceries.map((item) => item.toJson()).toList());
    prefs.setString('groceries', jsonString);
  }
}
