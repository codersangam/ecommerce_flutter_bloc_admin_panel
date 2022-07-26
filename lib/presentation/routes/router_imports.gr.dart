// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:ecommerce_flutter_bloc_admin_panel/presentation/screens/home_screen.dart'
    as _i1;
import 'package:ecommerce_flutter_bloc_admin_panel/presentation/screens/orders/orders_screen.dart'
    as _i4;
import 'package:ecommerce_flutter_bloc_admin_panel/presentation/screens/products/new_product_screen.dart'
    as _i3;
import 'package:ecommerce_flutter_bloc_admin_panel/presentation/screens/products/product_screen.dart'
    as _i2;
import 'package:flutter/material.dart' as _i6;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    ProductScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.ProductScreen());
    },
    NewProductScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.NewProductScreen());
    },
    OrdersScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.OrdersScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeScreenRoute.name, path: '/'),
        _i5.RouteConfig(ProductScreenRoute.name, path: '/product-screen'),
        _i5.RouteConfig(NewProductScreenRoute.name,
            path: '/new-product-screen'),
        _i5.RouteConfig(OrdersScreenRoute.name, path: '/orders-screen')
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i5.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i2.ProductScreen]
class ProductScreenRoute extends _i5.PageRouteInfo<void> {
  const ProductScreenRoute()
      : super(ProductScreenRoute.name, path: '/product-screen');

  static const String name = 'ProductScreenRoute';
}

/// generated route for
/// [_i3.NewProductScreen]
class NewProductScreenRoute extends _i5.PageRouteInfo<void> {
  const NewProductScreenRoute()
      : super(NewProductScreenRoute.name, path: '/new-product-screen');

  static const String name = 'NewProductScreenRoute';
}

/// generated route for
/// [_i4.OrdersScreen]
class OrdersScreenRoute extends _i5.PageRouteInfo<void> {
  const OrdersScreenRoute()
      : super(OrdersScreenRoute.name, path: '/orders-screen');

  static const String name = 'OrdersScreenRoute';
}
