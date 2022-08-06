import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Orders extends Equatable {
  final int id;
  final int customerId;
  final List<dynamic> productIds;
  final int total;
  final int subTotal;
  final bool isAccepted;
  final bool isDelivered;
  final bool isCancelled;
  final DateTime createdAt;

  const Orders(
      {required this.id,
      required this.customerId,
      required this.productIds,
      required this.total,
      required this.subTotal,
      required this.isAccepted,
      required this.isDelivered,
      required this.isCancelled,
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
      'isCancelled': isCancelled,
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
        isCancelled: snapshot['isCancelled'],
        createdAt: snapshot['createdAt'].toDate());
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
        isCancelled,
        createdAt
      ];

  static List<Orders> orders = [
    Orders(
      id: 1,
      customerId: 2345,
      productIds: const [1, 2, 3],
      total: 999,
      subTotal: 999,
      isAccepted: false,
      isDelivered: false,
      isCancelled: false,
      createdAt: DateTime.now(),
    ),
    Orders(
      id: 2,
      customerId: 2345,
      productIds: const [6, 4, 5],
      total: 1999,
      subTotal: 1999,
      isAccepted: true,
      isDelivered: false,
      isCancelled: false,
      createdAt: DateTime.now(),
    ),
  ];
}
