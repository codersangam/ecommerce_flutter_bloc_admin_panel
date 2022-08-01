import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String imageUrl;
  final String details;
  final bool isPopular;
  final bool isRecommended;
  double price;
  int quantity;

  Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.imageUrl,
      required this.details,
      required this.isPopular,
      required this.isRecommended,
      this.price = 0,
      this.quantity = 0});
  @override
  List<Object?> get props => [
        id,
        name,
        category,
        imageUrl,
        price,
        details,
        isPopular,
        isRecommended,
        price,
        quantity
      ];

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    return Product(
        id: snapshot['id'],
        name: snapshot['name'],
        category: snapshot['category'],
        imageUrl: snapshot['imageUrl'],
        details: snapshot['details'],
        isPopular: snapshot['isPopular'],
        isRecommended: snapshot['isRecommended'],
        price: snapshot['price'],
        quantity: snapshot['quantity']);
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'details': details,
      'isPopular': isPopular,
      'isRecommended': isRecommended,
      'price': price,
      'quantity': quantity
    };
  }

  static List<Product> products = [
    Product(
      id: 1,
      name: "Pepsi",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1629203851122-3726ecdf080e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=929&q=80",
      price: 299,
      details:
          "Great tasting refreshment. Live for now! Carbonated Water, Sugar, Colour (Caramel E150d), Acid (Phosphoric Acid), Flavourings (including Caffeine).",
      isPopular: true,
      isRecommended: false,
    ),
    Product(
      id: 2,
      name: "Momo",
      category: "Fast Food",
      imageUrl:
          "https://images.unsplash.com/photo-1626776876729-bab4369a5a5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80",
      price: 500,
      details:
          "Momo (the food) are delicious little filled dumplings popular in northern Asian countries. We’ve eaten momo in Nepal, Bhutan, Tibet, China and India, but you’re likely to find momo anywhere there is a Nepali restaurant. In fact, these tasty offerings are a staple in Kathmandu, they can be a street food in Nepal or you can find them on menus in tea houses and restaurants.",
      isPopular: false,
      isRecommended: true,
    ),
    Product(
      id: 3,
      name: "Fish Curry",
      category: "Dinner",
      imageUrl:
          "https://images.unsplash.com/photo-1626508035297-0cd27c397d67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      price: 199,
      details:
          "Fish curry made with fresh fish, onions, tomatoes, coconut, spices and herbs. Make the easiest, delicious and flavorsome fish curry with my easy step by step recipe. Also known as Indian fish masala it is a sea food lovers’ favorite. Fish curry is a staple in a lot of Asian countries and is made in various ways using many different locally available ingredients like coconut, poppy seeds, tamarind etc.",
      isPopular: true,
      isRecommended: true,
    ),
    Product(
      id: 4,
      name: "Rice",
      category: "Lunch",
      imageUrl:
          "https://images.unsplash.com/photo-1603133872878-684f208fb84b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80",
      price: 765,
      details:
          "Rice is a staple food for more than halfTrusted Source of the world’s population, and 90% of the world’s rice comes from Asia.There are thousands of types of rice, but depending on how producers process them, they fit into two groups: white or brown (whole grain).White rice is the most common type, though brown rice offers more health benefits. Brown rice comes in a variety of shades, including reddish, purplish, or black.",
      isPopular: true,
      isRecommended: false,
    ),
    Product(
      id: 5,
      name: "Noodles",
      category: "Fast Food",
      imageUrl:
          "https://images.unsplash.com/photo-1634864572865-1cf8ff8bd23d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1034&q=80",
      price: 145,
      details:
          "Noodles are one of the most important traditional staple foods in Asia. Noodles are typically made from unleavened wheat dough and are stretched, extruded, or rolled, and then cut into varying shapes. Noodles account for approximately 20%–50% of the total wheat consumed in Asia, and its popularity has extended to many countries outside of Asia (Hou, 2010a).",
      isPopular: true,
      isRecommended: true,
    ),
    Product(
      id: 6,
      name: "Coke",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1581098365948-6a5a912b7a49?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      price: 60,
      details:
          "Coke Zero is a sugar-free soda. It serves as an alternative to the traditional diet calorie-free Diet Coke. Zero refers to the fact that it contains no calories. Coke Zero is an increasingly popular drink and is widely available in most grocery stores. Many people think that since it contains no calories, it is safe to drink. ",
      isPopular: true,
      isRecommended: false,
    ),
  ];
}
