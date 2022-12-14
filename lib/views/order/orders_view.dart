import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../config/ui_constants.dart';
import '../../controller/order_controller.dart';
import '../../routes/routes.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Get.find<OrderController>().readAllOrderFromDB();
    List<String> myTabs = [
      AppLocalizations.of(context)!.tempOrder,
      AppLocalizations.of(context)!.createdOrder,
      AppLocalizations.of(context)!.deliveringOrder,
      AppLocalizations.of(context)!.deliveredOrder,
    ];
    TabController tabController = TabController(
      vsync: this,
      length: myTabs.length,
    );
    var size = Get.size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppLocalizations.of(context)!.titleOrder,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        height: Get.size.height,
        child: GetBuilder<OrderController>(
          builder: (orderController) => Column(
            children: [
              TabBar(
                controller: tabController,
                unselectedLabelColor: Colors.amber,
                labelColor: Colors.redAccent,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: myTabs[0],
                  ),
                  Tab(
                    text: myTabs[1],
                  ),
                  Tab(
                    text: myTabs[2],
                  ),
                  Tab(
                    text: myTabs[3],
                  )
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      orderController.orders.isNotEmpty
                          ? orderController.isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.builder(
                                  itemCount: orderController.orders.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () => Get.toNamed(
                                      Routes.getOrderDetailPage(index),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          height: 160,
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: Icon(
                                                  Icons.shopping_cart_rounded,
                                                  color: Colors.green,
                                                  size: 50,
                                                ),
                                              ),
                                              Container(
                                                color: Colors.white70,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${AppLocalizations.of(context)!.customerTabbar} '
                                                      '${orderController.orders[index].customerName}',
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      style: TextStyle(
                                                          fontSize:
                                                              kProductStyle(
                                                                      size *
                                                                          1.7)
                                                                  .fontSize,
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      intl.DateFormat(
                                                              'dd-MM-yyyy kk:mm:ss')
                                                          .format(
                                                        DateTime.parse(
                                                          orderController
                                                              .orders[index]
                                                              .time!,
                                                        ),
                                                      ),
                                                      style: TextStyle(
                                                          fontSize:
                                                              kProductStyle(
                                                                      size *
                                                                          1.5)
                                                                  .fontSize,
                                                          color: Colors.grey),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${orderController.listValuesMapOrder[index]!.length} ${AppLocalizations.of(context)!.textProduct}',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  kProductStyle(
                                                                          size *
                                                                              1.7)
                                                                      .fontSize,
                                                              color: Colors
                                                                  .black87),
                                                        ),
                                                        Text(
                                                          '${AppLocalizations.of(context)!.textTotalPriceOrder} ${orderController.orders[index].totalPrice}',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  kProductStyle(
                                                                          size *
                                                                              1.7)
                                                                      .fontSize,
                                                              color: Colors
                                                                  .black87),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                )
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 200),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/empty_order.png',
                                    height: 300,
                                    width: 300,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .textEmptyOrder,
                                    style: const TextStyle(
                                      fontSize: 32,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 200),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/empty_order.png',
                              height: 300,
                              width: 300,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              AppLocalizations.of(context)!.textEmptyOrder,
                              style: const TextStyle(
                                fontSize: 32,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 200),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/empty_order.png',
                              height: 300,
                              width: 300,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              AppLocalizations.of(context)!.textEmptyOrder,
                              style: const TextStyle(
                                fontSize: 32,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 200),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/empty_order.png',
                              height: 300,
                              width: 300,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              AppLocalizations.of(context)!.textEmptyOrder,
                              style: const TextStyle(
                                fontSize: 32,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
