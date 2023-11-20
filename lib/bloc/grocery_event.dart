// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'grocery_bloc.dart';

@immutable
sealed class GroceryEvent extends Equatable {
  const GroceryEvent();
}

class AddDataEvent extends GroceryEvent {
  final GroceryItem item;
  const AddDataEvent(
    this.item,
  );
  @override
  List<Object> get props => [item];
}

class DeleteDataEvent extends GroceryEvent {
  final GroceryItem item;
  const DeleteDataEvent(
    this.item,
  );
  @override
  List<Object> get props => [item];
}

class ClearBoxEvent extends GroceryEvent {
  ClearBoxEvent();
  final box = Hive.box('grocery_box');

  @override
  List<Object?> get props => [];
}
