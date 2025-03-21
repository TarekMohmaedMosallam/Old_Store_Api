part of 'platzi_product_bloc.dart';

sealed class PlatziProductEvent extends Equatable {
  const PlatziProductEvent();

  @override
  List<Object> get props => [];
}

final class PlatziProductSuccess extends PlatziProductEvent {}

final class PlatziProductFailed extends PlatziProductEvent {}

final class PlatziProductRefush extends PlatziProductEvent {}

final class PlatziProductDisplaySeclected extends PlatziProductEvent {
  final String title;
  final String image;
  final double price;

  const PlatziProductDisplaySeclected({
    required this.title,
    required this.image,
    required this.price,
  });

  @override
  List<Object> get props => [title, image, price];
}
final class AddToCart extends PlatziProductEvent {
  final ProductLists product;

  const AddToCart({required this.product});

  @override
  List<Object> get props => [product];
}

final class RemoveFromCart extends PlatziProductEvent {
  final ProductLists product;

  const RemoveFromCart({required this.product});

  @override
  List<Object> get props => [product];
}
