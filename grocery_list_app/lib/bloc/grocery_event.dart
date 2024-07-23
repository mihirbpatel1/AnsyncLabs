import 'package:equatable/equatable.dart';
import '../models/grocery_item.dart';

abstract class GroceryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadGroceries extends GroceryEvent {}

class AddGrocery extends GroceryEvent {
  final GroceryItem item;

  AddGrocery(this.item);

  @override
  List<Object> get props => [item];
}

class UpdateGrocery extends GroceryEvent {
  final GroceryItem item;

  UpdateGrocery(this.item);

  @override
  List<Object> get props => [item];
}

class DeleteGrocery extends GroceryEvent {
  final String id;

  DeleteGrocery(this.id);

  @override
  List<Object> get props => [id];
}
