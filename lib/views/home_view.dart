import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import '../config/ui_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../controller/cart_controller.dart';
import '../controller/product_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        Get.find<ProductController>().isFilter
            ? null
            : Get.find<ProductController>().scrollProduct();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().readAllProductFromDB();
    var size = Get.size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 18, right: 18),
            child: GetBuilder<ProductController>(
              builder: (productController) => TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.textfieldSearch,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                onChanged: (value) async {
                  await Get.find<ProductController>().filterProduct(value);
                  if (scrollController.hasClients) {
                    scrollController.jumpTo(0.0);
                  }
                  if (value.isEmpty) {
                    await productController.noFilterProduct();
                    if (scrollController.hasClients) {
                      scrollController.jumpTo(0.0);
                    }
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: GetBuilder<ProductController>(
                builder: (productController) {
                  return productController.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : productController.products.isNotEmpty
                          ? MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.builder(
                                controller: scrollController,
                                itemCount: (productController.isFilter ||
                                        productController.isNotHasData)
                                    ? productController.products.length
                                    : productController.products.length + 1,
                                itemBuilder: (context, index) {
                                  if (index <
                                      productController.products.length) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: SwipeActionCell(
                                        key: ObjectKey(
                                          productController.products[index],
                                        ),
                                        trailingActions: <SwipeAction>[
                                          SwipeAction(
                                            performsFirstActionWithFullSwipe:
                                                true,
                                            widthSpace: 160,
                                            color: Colors.white,
                                            title: AppLocalizations.of(context)!
                                                .addToCartButton,
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 14),
                                            onTap: (CompletionHandler
                                                handler) async {
                                              bool isAdd = await Get.find<
                                                      CartController>()
                                                  .addToCart(productController
                                                      .products[index]);
                                              if (isAdd) {
                                                await handler(true);
                                                productController
                                                    .removeProduct(index);
                                              }
                                            },
                                          ),
                                        ],
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 120,
                                              height: 120,
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                ),
                                                child: productController
                                                        .products[index]
                                                        .imageUrls!
                                                        .isEmpty
                                                    ? Image.network(
                                                        'https://previews.123rf.com/images/latkun/latkun1712/latkun171200130/92172856-empty-transparent-background-seamless-pattern.jpg?fj=1',
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.network(
                                                        productController
                                                            .products[index]
                                                            .imageUrls![0]!,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 120,
                                                color: Colors.white,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 10),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 40,
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          bottom: 6,
                                                        ),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            productController
                                                                .products[index]
                                                                .name!,
                                                            style:
                                                                kProductStyle(
                                                                    size),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: size.height *
                                                              0.05),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            productController
                                                                .products[index]
                                                                .price
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    kProductStyle(
                                                                            size)
                                                                        .fontSize,
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                          Text(
                                                            AppLocalizations.of(
                                                                        context)!
                                                                    .textInventory +
                                                                productController
                                                                    .products[
                                                                        index]
                                                                    .stock
                                                                    .toString(),
                                                            style: TextStyle(
                                                              fontSize:
                                                                  kProductStyle(
                                                                          size)
                                                                      .fontSize,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                    );
                                  }
                                },
                              ),
                            )
                          : const Center(
                              child: Text(
                                'Empty',
                                style: TextStyle(fontSize: 24),
                              ),
                            );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
