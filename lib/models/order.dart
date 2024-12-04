import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final String orderId;
  final Map<String, double> items; // VegetableID -> Quantity
  final double totalAmount;
  final DateTime timestamp;

  Order({
    required this.orderId,
    required this.items,
    required this.totalAmount,
    required this.timestamp,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
