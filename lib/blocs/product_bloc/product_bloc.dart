import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../controller/repositories.dart';
import '../../models/product_model.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    List<ProductModel> products = [];
    Map m = {};
    double totalAmount = 0;
    on<ProductLoadedEvent>((event, emit) async {
      emit(ProductInitialState());
      products = await Repositories().getProductData();

      for (int i = 0; i < products.length; i++) {
        m[products[i].name] = TextEditingController(text: '0');
      }

      emit(ProductLoadedState(products, m, totalAmount));
    });
    on<ProductQuantityIncrementEvent>((event, emit) async {
      int qty = int.parse(event.quickMap.values.first);
      double price = double.parse(event.quickMap['price']);
      qty++;
      double quickPrice = qty * price;
      totalAmount += quickPrice;

      m[event.quickMap.keys.first] = TextEditingController(text: qty.toString());

      emit(ProductLoadedState(products, m, totalAmount));
    });
  }
}
