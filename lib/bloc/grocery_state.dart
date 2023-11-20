part of 'grocery_bloc.dart';

@immutable
sealed class GroceryState {
  const GroceryState();
}

class GroceryInitialState extends GroceryState {
  const GroceryInitialState();
}

// Loading state is not because Hive does not load date as it notify and rnthe task in background...

class GroceryLoadedState extends GroceryState {
  final dynamic msg;
  const GroceryLoadedState({required this.msg});

}
class GroceryDeletedState extends GroceryState {
  final dynamic msg;
  const GroceryDeletedState({required this.msg});
}
class GroceryClearedState extends GroceryState {
  final dynamic msg;
  const GroceryClearedState({required this.msg});
}


