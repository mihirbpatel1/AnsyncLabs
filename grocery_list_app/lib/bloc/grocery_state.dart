import 'package:equatable/equatable.dart';
import '../models/grocery_item.dart';

abstract class GroceryState extends Equatable {
  @override
  List<Object> get props => [];
}

class GroceryInitial extends GroceryState {}

class GroceriesLoaded extends GroceryState {
  final List<GroceryItem> groceries;

  GroceriesLoaded(this.groceries);

  @override
  List<Object> get props => [groceries];
}

class GroceryError extends GroceryState {
  final String message;

  GroceryError(this.message);

  @override
  List<Object> get props => [message];
}
