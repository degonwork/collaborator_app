import 'package:collaborator_app/controller/order_controller.dart';
import 'package:collaborator_app/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/cart.dart';
import '../data/model/order.dart';
import '../data/model/product.dart';
import '../data/repository/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<Cart>? _carts = [];
  List<Cart>? get carts => _carts;

  int _subTotalPrice = 0;
  int get subTotalPrice => _subTotalPrice;

  int _totalWeight = 0;
  int get totalWeight => _totalWeight;

  int? _orderId;
  int? get orderId => _orderId;

  CartController({
    required this.cartRepo,
  });

  Future<bool> addToCart(Product product) async {
    _carts ??= [];
    int? maxId;
    for (int i = 0; i < _carts!.length; i++) {
      if (_carts![i].productId == product.id) {
        if (_carts![i].quantity == product.stock) {
          Get.snackbar(
            "Can't add",
            "Product is not enough",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          return false;
        } else {
          _carts![i].quantity += 1;
          await updateCartToDB(_carts![i]);
          await getTotalWeight(_carts);
          getTotalPrice(_carts);
          return true;
        }
      }
    }
    await getOrderIdFromDB();
    List<Cart>? listCarts = await cartRepo.readAllCartFromDB();
    if (listCarts != null) {
      listCarts.sort((a, b) => a.id! - b.id!);
      maxId = listCarts.last.id!;
    } else {
      listCarts = [];
    }
    Cart cart = Cart(
      id: listCarts.isEmpty ? (listCarts.length + 1) : maxId! + 1,
      productId: product.id,
      orderId: _orderId,
      productName: product.name,
      productImage: product.imageUrls!.isNotEmpty ? product.imageUrls : [],
      unitPrice: product.price,
      quantity: 1,
      isExisted: false,
    );
    _carts!.add(cart);
    if (carts!.isNotEmpty) {
      await cartRepo.createCartToDB(carts: carts);
      await getTotalWeight(_carts);
      getTotalPrice(_carts);
      print("Create cart to DB");
    }
    update();
    return true;
  }

  Future<List<Cart>?> readAllCartByOrderIdFromDB(int orderId) async {
    return await cartRepo.readAllCartByOrderIdFromDB(orderId);
  }

  Future<List<Cart>?> readAllCartIsNotExitedFromDB() async {
    _isLoading = true;
    _carts = [];
    _carts = await cartRepo.readAllCartIsNotExistedFromDB();
    if (_carts != null) {
      await getTotalWeight(_carts);
      getTotalPrice(_carts);
    }
    await getOrderIdFromDB();
    _isLoading = false;
    update();
    return _carts;
  }

  Future<void> updateCartToDB(Cart cart) async {
    await cartRepo.updateCartToDB(cart);
  }

  void getTotalPrice(List<Cart>? carts) {
    _subTotalPrice = 0;
    for (var element in carts!) {
      _subTotalPrice += element.unitPrice! * element.quantity;
    }
    update();
  }

  Future<void> getTotalWeight(List<Cart>? carts) async {
    _totalWeight = 0;
    for (var element in carts!) {
      Product? product = await Get.find<ProductController>()
          .readProductByIdFromDB(element.productId);
      _totalWeight += product!.weight! * element.quantity;
    }
    update();
  }

  Future<void> increment(int index) async {
    Product? product = await Get.find<ProductController>()
        .readProductByIdFromDB(_carts![index].productId);
    if (_carts![index].quantity == product!.stock) {
      Get.snackbar(
        "Can't add",
        "Product is not enough",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    _carts![index].quantity += 1;
    _subTotalPrice += _carts![index].unitPrice!;
    await updateCartToDB(_carts![index]);
    _totalWeight += product.weight!;
    update();
  }

  Future<void> decrement(int index) async {
    Product? product = await Get.find<ProductController>()
        .readProductByIdFromDB(_carts![index].productId);
    _carts![index].quantity -= 1;
    _subTotalPrice -= _carts![index].unitPrice!;
    _totalWeight -= product!.weight!;
    if (_carts![index].quantity == 0) {
      await cartRepo.deleteCartByIdFromDb(_carts![index].id!);
      _carts!.removeAt(index);
      print("Delete product");
    } else {
      await updateCartToDB(_carts![index]);
    }
    update();
  }

  Future<void> getOrderIdFromDB() async {
    List<Order>? listOrders =
        await Get.find<OrderController>().readAllOrderFromDB();
    if (listOrders != null) {
      listOrders.sort((a, b) => a.id! - b.id!);
      _orderId = listOrders.last.id! + 1;
    } else {
      listOrders = [];
      _orderId = listOrders.length + 1;
    }
    update();
  }
}
