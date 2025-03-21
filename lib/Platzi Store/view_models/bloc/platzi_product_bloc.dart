import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:platzi_store/Platzi%20Store/model/APIs/Products.dart';
import 'package:platzi_store/Platzi%20Store/model/Api_Categories/Product_Lists.dart';

part 'platzi_product_event.dart';
part 'platzi_product_state.dart';

class PlatziProductBloc extends Bloc<PlatziProductEvent, PlatziProductState> {
  PlatziProductBloc() : super(PlatziProductInitial()) {
    on<PlatziProductSuccess>(_loadProducts);
    on<AddToCart>(_addToCart);
    on<RemoveFromCart>(_removeFromCart);
  }

  FutureOr<void> _loadProducts(
    PlatziProductSuccess event,
    Emitter<PlatziProductState> emit,
  ) async {
    emit(PlatziProductLoading());
    try {
      final List<ProductLists> products = await Products.getProducts();
      emit(PlatziProductLoaded(products: products, cart: []));
    } catch (e) {
      emit(PlatziProductError(error: e.toString()));
    }
  }

 FutureOr<void> _addToCart(AddToCart event, Emitter<PlatziProductState> emit) {
  if (state is PlatziProductLoaded) {
    final loadedState = state as PlatziProductLoaded;
    final updatedCart = List<ProductLists>.from(loadedState.cart)..add(event.product);

    debugPrint("🛒 Adding to cart: ${event.product.title}");
    debugPrint("Cart now has: ${updatedCart.length} items");

    emit(PlatziProductLoaded(products: loadedState.products, cart: updatedCart));
  }
}


  FutureOr<void> _removeFromCart(
    RemoveFromCart event,
    Emitter<PlatziProductState> emit,
  ) {
    if (state is PlatziProductLoaded) {
      final loadedState = state as PlatziProductLoaded;
      final updatedCart = List<ProductLists>.from(loadedState.cart)
        ..remove(event.product);

      emit(
        PlatziProductLoaded(products: loadedState.products, cart: updatedCart),
      );
    }
  }
}
