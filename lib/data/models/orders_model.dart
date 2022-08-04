import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Orders extends Equatable {
  final int id;
  final int customerId;
  final List<int> productIds;
  final double total;
  final double subTotal;
  final bool isAccepted;
  final bool isDelivered;
  final DateTime createdAt;

  const Orders(
      {required this.id,
      required this.customerId,
      required this.productIds,
      required this.total,
      required this.subTotal,
      required this.isAccepted,
      required this.isDelivered,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerId': customerId,
      'productIds': productIds,
      'total': total,
      'subTotal': subTotal,
      'isAccepted': isAccepted,
      'isDelivered': isDelivered,
      'createdAt': createdAt.toIso8601String()
    };
  }

  factory Orders.fromSnapshot(DocumentSnapshot snapshot) {
    return Orders(
        id: snapshot['id'],
        customerId: snapshot['customerId'],
        productIds: snapshot['productIds'],
        total: snapshot['total'],
        subTotal: snapshot['subTotal'],
        isAccepted: snapshot['isAccepted'],
        isDelivered: snapshot['isDelivered'],
        createdAt: DateTime.parse(snapshot['createdAt']));
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        customerId,
        productIds,
        total,
        subTotal,
        isAccepted,
        isDelivered,
        createdAt
      ];

  static List<Orders> orders = [
    Orders(
      id: 1,
      customerId: 2345,
      productIds: const [1],
      total: 999.0,
      subTotal: 999.0,
      isAccepted: false,
      isDelivered: false,
      createdAt: DateTime.now(),
    ),
    Orders(
      id: 2,
      customerId: 2345,
      productIds: const [1],
      total: 1999.0,
      subTotal: 1999.0,
      isAccepted: true,
      isDelivered: false,
      createdAt: DateTime.now(),
    ),
  ];
}
