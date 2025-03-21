part of 'platzi_product_bloc.dart';

sealed class PlatziProductState extends Equatable {
  const PlatziProductState();

  @override
  List<Object> get props => [];
}

final class PlatziProductInitial extends PlatziProductState {}

final class PlatziProductLoading extends PlatziProductState {}

final class PlatziProductLoaded extends PlatziProductState {
  const PlatziProductLoaded({
    required this.products,
    this.cart = const [],
  });

  final List<ProductLists> products;
  final List<ProductLists> cart;

  @override
  List<Object> get props => [products, cart];
}


final class PlatziProductRefushing extends PlatziProductState {}


final class PlatziProductError extends PlatziProductState {
  const PlatziProductError({required this.error});

  final String error;
}

