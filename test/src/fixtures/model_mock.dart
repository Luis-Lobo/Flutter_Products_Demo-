import 'package:flutter_products_demo/src/features/authentication/domain/model/user_model.dart';
import 'package:flutter_products_demo/src/features/products/domain/models/product_model.dart';
import 'package:flutter_products_demo/src/features/products/domain/models/rating_model.dart';

class ModelMock {
  static UserModel get userModel => const UserModel(
        name: "name",
        email: "email",
        photoUrl: "photoUrl",
      );

  static RatingModel get ratingModel => const RatingModel(rate: 3.9, count: 120);

  static ProductModel get productModel => ProductModel(
        id: 1,
        title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        price: 109.95,
        description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        category: "men's clothing",
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        rating: ratingModel,
      );

  static List<ProductModel> get productsList => [productModel, productModel];

  static List<String> get imagesUrls => [
        "lib/src/core/assets/images/banner1.jpg",
        "lib/src/core/assets/images/banner2.jpg",
        "lib/src/core/assets/images/banner3.jpg",
        "lib/src/core/assets/images/banner4.jpg",
      ];
}
