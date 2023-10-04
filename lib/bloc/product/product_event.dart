abstract class ProductEvent {}

class ProductInitialEvent extends ProductEvent {
  final String productId;
  ProductInitialEvent({required this.productId});
}
