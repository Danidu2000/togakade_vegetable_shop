import 'package:json_annotation/json_annotation.dart';

part 'vegetable.g.dart';

@JsonSerializable()
class Vegetable {
  final String id;
  final String name;
  final double pricePerKg;
  late final double availableQuantity;
  final String category; // leafy, root, fruit
  final DateTime expiryDate;

  Vegetable({
    required this.id,
    required this.name,
    required this.pricePerKg,
    required this.availableQuantity,
    required this.category,
    required this.expiryDate,
  });

  factory Vegetable.fromJson(Map<String, dynamic> json) => _$VegetableFromJson(json);
  Map<String, dynamic> toJson() => _$VegetableToJson(this);
}
