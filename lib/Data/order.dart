import "package:flutter/material.dart";

class Order {
  final String pickupLocation;
  final String dropOffLocation;
  final String selectedType;
  final int totalPrice;

  Order({
    required this.pickupLocation,
    required this.dropOffLocation,
    required this.selectedType,
    required this.totalPrice,
  });
}
