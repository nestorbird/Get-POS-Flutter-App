import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../db_utils/db_constants.dart';
part 'taxes.g.dart';

@HiveType(typeId: TaxBoxTypeId)
class Taxes extends HiveObject {
  @HiveField(0)
  String taxId;

  @HiveField(1)
  String itemTaxTemplate;

  @HiveField(2)
  String taxType;

  @HiveField(3)
  double taxRate;

  Taxes({
    required this.taxId,
    required this.itemTaxTemplate,
    required this.taxType,
    required this.taxRate,
  });

  Taxes copyWith({
    String? taxId,
    String? itemTaxTemplate,
    String? taxType,
    double? taxRate,
    double? taxAmount,
  }) {
    return Taxes(
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

  factory Taxes.fromMap(Map<String, dynamic> map) {
    return Taxes(
      taxId: map["taxId"] ?? "",
      itemTaxTemplate: map['itemTaxTemplate'] ?? '',
      taxType: map['taxType'] ?? '',
      taxRate: map['taxRate'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory Taxes.fromJson(String source) => Taxes.fromMap(json.decode(source));
//
  @override
  String toString() =>
      'Taxes(taxId: $taxId,itemTaxTemplate: $itemTaxTemplate, taxType: $taxType, tax: $taxRate )';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Taxes &&
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
