import 'package:get/get.dart';
import '../views/address_view.dart';
import '../views/cart_view.dart';
import '../views/check_out/order_by_view.dart';
import '../views/check_out/select_transport_view.dart';
import '../views/controller_view.dart';
import '../views/home_view.dart';
import '../views/login_view.dart';
import '../views/order/order_detail_view.dart';
import '../views/order/orders_view.dart';
import '../views/signup_view.dart';

class Routes {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String address = '/address';
  static const String home = '/home';
  static const String control = '/control';
  static const String cart = '/cart';
  static const String transport = '/transport';
  static const String delivery = '/delivery';
  static const String orderDetail = '/orderdetail';
  static const String order = '/order';
  static String getLoginPage() => '$login';
  static String getSignUpPage() => '$signUp';
  static String getAddressPage() => '$address';
  static String gethomePage() => '$home';
  static String getControlViewPage() => '$control';
  static String getCartViewPage() => '$cart';
  static String getSelectTransportPage() => '$transport';
  static String getSelectDeliveryPage() => '$delivery';
  static String getOrderDetailPage(int pageId) => '$orderDetail?pageId=$pageId';
  static String getOrder() => '$order';
  static List<GetPage> listRoutes = [
    GetPage(name: login, page: () => const LoginView()),
    GetPage(name: signUp, page: () => const SignUpView()),
    GetPage(name: control, page: () => const ControlView()),
    GetPage(name: address, page: () => const AddressView()),
    GetPage(name: home, page: () => const HomeView()),
    GetPage(name: cart, page: () => const CartView()),
    GetPage(name: transport, page: () => const SelectTransport()),
    GetPage(name: delivery, page: () => const OrderByView()),
    GetPage(
        name: orderDetail,
        page: () {
          var pageId = Get.parameters['pageId'];
          return OrderDetail(
            pageId: int.parse(pageId!),
          );
        }),
    GetPage(name: order, page: () => const OrderView()),
  ];
}
