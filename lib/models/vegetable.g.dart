// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vegetable _$VegetableFromJson(Map<String, dynamic> json) => Vegetable(
      id: json['id'] as String,
      name: json['name'] as String,
      pricePerKg: (json['pricePerKg'] as num).toDouble(),
      availableQuantity: (json['availableQuantity'] as num).toDouble(),
      category: json['category'] as String,
      expiryDate: DateTime.parse(json['expiryDate'] as String),
    );

Map<String, dynamic> _$VegetableToJson(Vegetable instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pricePerKg': instance.pricePerKg,
      'availableQuantity': instance.availableQuantity,
      'category': instance.category,
      'expiryDate': instance.expiryDate.toIso8601String(),
    };
