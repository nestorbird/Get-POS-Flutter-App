import 'dart:convert';

import 'package:hive/hive.dart';

import '../db_utils/db_constants.dart';
part 'orderwise_tax.g.dart';

@HiveType(typeId: OrderwiseTaxBoxTypeId)
class OrderTax extends HiveObject {
  @HiveField(0)
  String? taxId;

  @HiveField(1)
  String itemTaxTemplate;

  @HiveField(2)
  String taxType;

  @HiveField(3)
  double taxRate;

  OrderTax({
     this.taxId,
    required this.itemTaxTemplate,
    required this.taxType,
    required this.taxRate,
  });

  OrderTax copyWith({
    String? taxId,
    String? itemTaxTemplate,
    String? taxType,
    double? taxRate,
    double? taxAmount,
  }) {
    return OrderTax(
      taxId: taxId ?? this.taxId,
      itemTaxTemplate: itemTaxTemplate ?? this.itemTaxTemplate,
      taxType: taxType ?? this.taxType,
      taxRate: taxRate ?? this.taxRate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'taxId': taxId,
      'itemTaxTemplate': itemTaxTemplate,
      'taxType': taxType,
      'taxRate': taxRate,
    };
  }

  factory OrderTax.fromMap(Map<String, dynamic> map) {
    return OrderTax(
      taxId: map['taxId'] ?? '',
      itemTaxTemplate: map['itemTaxTemplate'] ?? '',
      taxType: map['taxType'] ?? '',
      taxRate: map['taxRate'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory OrderTax.fromJson(String source) =>
      OrderTax.fromMap(json.decode(source));
//
  @override
  String toString() =>
      'Taxes(itemTaxTemplate: $itemTaxTemplate, taxType: $taxType, tax: $taxRate , taxId: $taxId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderTax &&
        other.taxId == taxId &&
        other.itemTaxTemplate == itemTaxTemplate &&
        other.taxType == taxType &&
        other.taxRate == taxRate;
  }

  @override
  int get hashCode =>
      taxId.hashCode ^
      itemTaxTemplate.hashCode ^
      taxType.hashCode ^
      taxRate.hashCode;
}
