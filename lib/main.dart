import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_products_demo/src/features/products/domain/models/product_model.dart';
import 'package:flutter_products_demo/src/features/products/presentations/user_interfaces/product_details_ui.dart';
import 'package:flutter_products_demo/src/features/products/presentations/user_interfaces/products_home_ui.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

//late final ProductModel productModel;

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const ProductsHomeUI();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'product_details',
          builder: (BuildContext context, GoRouterState state) {
            final productModel = state.extra! as ProductModel;
            return ProductDetailsUI(
              productModel: productModel,
            );
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
