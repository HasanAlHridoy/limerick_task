part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductModel> products;
  final Map productsQuantity;
  final double totalAmount;

  ProductLoadedState(this.products, this.productsQuantity, this.totalAmount);
}
