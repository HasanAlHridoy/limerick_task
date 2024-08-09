part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class ProductLoadedEvent extends ProductEvent {}

class ProductQuantityIncrementEvent extends ProductEvent {
  final Map quickMap;

  ProductQuantityIncrementEvent(this.quickMap);
}

class ProductQuantityDecrementEvent extends ProductEvent {
  final int quantity;

  ProductQuantityDecrementEvent(this.quantity);
}
