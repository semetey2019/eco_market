import '../../data/models/ordered_product_model.dart';

class OrderEntity {
  int? orderNumber;
  String? phoneNumber;
  String? address;
  String? referencePoint;
  String? comments;
  String? totalAmount;
  String? createdAt;
  int? deliveryCost;
  List<OrderedProductModel>? orderedProducts;

  OrderEntity({
    this.orderNumber,
    this.phoneNumber,
    this.address,
    this.referencePoint,
    this.comments,
    this.totalAmount,
    this.createdAt,
    this.deliveryCost,
    this.orderedProducts,
  });
}
