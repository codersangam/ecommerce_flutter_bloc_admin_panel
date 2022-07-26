part of 'router_imports.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AdaptiveRoute(page: HomeScreen, initial: true),
    AdaptiveRoute(page: ProductScreen),
    AdaptiveRoute(page: NewProductScreen),
    AdaptiveRoute(page: OrdersScreen),
  ],
)
class $AppRouter {}
