import 'package:equatable/equatable.dart';
import 'package:flutter_products_demo/src/features/products/domain/models/product_model.dart';

class ProductsState extends Equatable {
  final ProductUIState uiState;
  final ProductUIPages uiPages;

  final List<String> imagesUrls;
  final List<ProductModel> products;
  final List<ProductModel> cartList;
  final List<ProductModel> filterList;
  final double totalPurchasePrice;
  final bool? addProductInCartList;
  final bool? removeProductInCartList;

  factory ProductsState.initial() => const ProductsState(
        uiState: ProductUIState.initial,
        uiPages: ProductUIPages.homePage,
      );

  const ProductsState({
    required this.uiState,
    required this.uiPages,
    this.imagesUrls = const [],
    this.products = const [],
    this.cartList = const [],
    this.filterList = const [],
    this.totalPurchasePrice = 0.0,
    this.addProductInCartList = false,
    this.removeProductInCartList = false,
  });

  ProductsState copyWith({
    ProductUIState? uiState,
    ProductUIPages? uiPages,
    List<String>? imagesUrls,
    List<ProductModel>? products,
    List<ProductModel>? cartList,
    List<ProductModel>? filterList,
    double? totalPurchasePrice,
    bool? addProductInCartList,
    bool? removeProductInCartList,
  }) =>
      ProductsState(
        uiState: uiState ?? this.uiState,
        uiPages: uiPages ?? this.uiPages,
        imagesUrls: imagesUrls ?? this.imagesUrls,
        products: products ?? this.products,
        cartList: cartList ?? this.cartList,
        filterList: filterList ?? this.filterList,
        totalPurchasePrice: totalPurchasePrice ?? this.totalPurchasePrice,
        addProductInCartList: addProductInCartList ?? this.addProductInCartList,
        removeProductInCartList: removeProductInCartList ?? this.removeProductInCartList,
      );

  bool get isHomePage => uiPages == ProductUIPages.homePage;
  bool get isCartPage => uiPages == ProductUIPages.cartPage;
  bool get isSearchPage => uiPages == ProductUIPages.searchPage;
  bool get isPaymentPage => uiPages == ProductUIPages.paymentPage;

  @override
  List<Object?> get props => [
        uiState,
        uiPages,
        imagesUrls,
        products,
        cartList,
        filterList,
        totalPurchasePrice,
        addProductInCartList,
        removeProductInCartList,
      ];
}

enum ProductUIState {
  initial,
  loading,
  success,
  error,
  addedToCart,
  removedToCart;

  bool get isSuccess => this == ProductUIState.success;

  bool get hasError => this == ProductUIState.error;

  bool get isLoading => this == ProductUIState.loading || this == ProductUIState.initial;
}

enum ProductUIPages { homePage, cartPage, searchPage, paymentPage }
