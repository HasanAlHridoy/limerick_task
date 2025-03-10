// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int? id;
  String? code;
  String? name;
  int? unitId;
  String? price;
  String? secondaryPrice;
  String? sku;
  String? packSize;
  String? stock;
  String? type;
  int? categoryId;
  String? notes;
  String? vat;
  String? status;
  dynamic stdPriceAccounts;
  dynamic vatValueAccounts;
  String? sdvInv;
  String? sdInv;
  String? vatInv;
  int? unitSupply;
  String? unitSupplyQty;
  int? mushok64Show;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? deletedAt;
  String? tradeOfferInputQty;
  String? tradeOfferQty;
  String? unitName;
  String? unitQty;
  String? categoryName;
  String? stockQty;

  ProductModel({
    this.id,
    this.code,
    this.name,
    this.unitId,
    this.price,
    this.secondaryPrice,
    this.sku,
    this.packSize,
    this.stock,
    this.type,
    this.categoryId,
    this.notes,
    this.vat,
    this.status,
    this.stdPriceAccounts,
    this.vatValueAccounts,
    this.sdvInv,
    this.sdInv,
    this.vatInv,
    this.unitSupply,
    this.unitSupplyQty,
    this.mushok64Show,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.tradeOfferInputQty,
    this.tradeOfferQty,
    this.unitName,
    this.unitQty,
    this.categoryName,
    this.stockQty,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        unitId: json["unit_id"],
        price: json["price"],
        secondaryPrice: json["secondary_price"],
        sku: json["sku"],
        packSize: json["pack_size"],
        stock: json["stock"],
        type: json["type"],
        categoryId: json["category_id"],
        notes: json["notes"],
        vat: json["vat"],
        status: json["status"],
        stdPriceAccounts: json["std_price_accounts"],
        vatValueAccounts: json["vat_value_accounts"],
        sdvInv: json["sdv_inv"],
        sdInv: json["sd_inv"],
        vatInv: json["vat_inv"],
        unitSupply: json["unit_supply"],
        unitSupplyQty: json["unit_supply_qty"],
        mushok64Show: json["mushok_6_4_show"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        tradeOfferInputQty: json["tradeOfferInputQty"],
        tradeOfferQty: json["tradeOfferQty"],
        unitName: json["unit_name"],
        unitQty: json["unit_qty"],
        categoryName: json["category_name"],
        stockQty: json["stockQty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "unit_id": unitId,
        "price": price,
        "secondary_price": secondaryPrice,
        "sku": sku,
        "pack_size": packSize,
        "stock": stock,
        "type": type,
        "category_id": categoryId,
        "notes": notes,
        "vat": vat,
        "status": status,
        "std_price_accounts": stdPriceAccounts,
        "vat_value_accounts": vatValueAccounts,
        "sdv_inv": sdvInv,
        "sd_inv": sdInv,
        "vat_inv": vatInv,
        "unit_supply": unitSupply,
        "unit_supply_qty": unitSupplyQty,
        "mushok_6_4_show": mushok64Show,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "tradeOfferInputQty": tradeOfferInputQty,
        "tradeOfferQty": tradeOfferQty,
        "unit_name": unitName,
        "unit_qty": unitQty,
        "category_name": categoryName,
        "stockQty": stockQty,
      };
}
