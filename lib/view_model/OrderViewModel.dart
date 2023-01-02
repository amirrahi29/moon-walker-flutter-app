import 'package:get/get.dart';
import 'package:moon_walker/model/OrderModel.dart';
import 'package:moon_walker/repository/OrdersRepository.dart';
import 'package:moon_walker/view_model/MainViewModel.dart';

class OrderViewModel extends GetxController{

  final mainViewModel = Get.put(MainViewModel());
  var orderList = <OrderModel>[].obs;
  var searchList = <OrderModel>[].obs;

  //user
  var userName = "".obs;
  var userEmail = "".obs;
  var userPhone = "".obs;
  var userImage = "".obs;

  //orders
  var orderNo = "".obs;
  var distributoSubtotal = "".obs;
  var distributorTax = "".obs;
  var distributorShipping = "".obs;
  var distributorCouponDiscount = "".obs;
  var distributorDiscount = "".obs;
  var distributorTotal = "".obs;
  var retailerSubtotal = "".obs;
  var retailerTax = "".obs;
  var retailerShipping = "".obs;
  var retailerCouponDiscount = "".obs;
  var retailerDiscount = "".obs;
  var retailerTotal = "".obs;
  var paymentMode = "".obs;
  var status = "".obs;

  //salesman
  var salesmanName = "".obs;
  var salesmanEmail = "".obs;
  var salesmanPhone = "".obs;
  var salesmanStatus = "".obs;
  var salesmanImage = "".obs;

  //distributor
  var distributorName = "".obs;
  var distributorEmail = "".obs;
  var distributorPhone = "".obs;
  var distributorStatus = "".obs;
  var distributorImage = "".obs;

  //address
  var addressName = "".obs;
  var addressEmail = "".obs;
  var addressPhone = "".obs;
  var addressAddress = "".obs;
  var addresslocality = "".obs;
  var addressCity = "".obs;
  var addressState = "".obs;
  var addressCountry = "".obs;
  var addressPincode = "".obs;
  var addressType = "".obs;

  //products
  var productList = <String>[].obs;
  var isOrderAvailable = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOrderListVm();
  }

  getOrderListVm() async{
    orderList.clear();
    searchList.clear();
    isOrderAvailable.value = 0;
    var result = await OrdersRepo.getAllOrders();
    if(result.isNotEmpty){
      isOrderAvailable.value = 1;
      orderList.value = result;
      searchList.addAll(orderList);
    }
    else if(result.isEmpty){
      isOrderAvailable.value = 2;
    }
    else{
      isOrderAvailable.value = 0;
    }
  }

  Future<Null> refreshList() async {
    mainViewModel.setMainLoader(false);
    await Future.delayed(Duration(seconds: 2));
    getOrderListVm();
    return null;
  }

  searchOrders(String text)async{
    searchList.clear();
    if(text.isEmpty){
      orderList.forEach((element) {
        searchList.add(element);
      });
    }
    else{
      orderList.forEach((element) {
        if(element.orderNo!.toLowerCase().contains(text)
        || element.user!.name!.toLowerCase().contains(text)
            || element.status!.toLowerCase().contains(text))
        {
          searchList.add(element);
        }
      });
    }
  }

  getOrderDetailsVm(int orderId) async{
    productList.clear();
    var result = await OrdersRepo.getOrderDetails(orderId);
    if(result !=null){
      for(var u in result['cart']){
        productList.add("Name: ${u['name']}\nPrice: ${u['price']}\nQunatity: ${u['quantity']}");
      }
      //user
      userName.value =result['user']['name'];
      userImage.value =result['user']['avatar'];
      userEmail.value =result['user']['email'];
      userPhone.value =result['user']['phone'];

      //order
      orderNo.value = result['order_no'];
      distributoSubtotal.value = result['distributor_subtotal'].toString();
      distributorTax.value = result['distributor_tax'].toString();
      distributorShipping.value = result['distributor_shipping'].toString();
      distributorCouponDiscount.value = result['distributor_coupon_discount'].toString();
      distributorDiscount.value = result['distributor_discount'].toString();
      distributorTotal.value = result['distributor_total'].toString();
      retailerSubtotal.value = result['retailer_subtotal'].toString();
      retailerTax.value = result['retailer_tax'].toString();
      retailerShipping.value = result['retailer_shipping'].toString();
      retailerCouponDiscount.value = result['retailer_coupon_discount'].toString();
      retailerDiscount.value = result['retailer_discount'].toString();
      retailerTotal.value = result['retailer_total'].toString();
      paymentMode.value = result['payment_mode'].toString();
      status.value = result['Pending'].toString();

      //salesman
      salesmanName.value = result['salesman']['name'].toString();
      salesmanEmail.value = result['salesman']['email'].toString();
      salesmanPhone.value = result['salesman']['phone'].toString();
      salesmanStatus.value = result['salesman']['status'].toString();
      salesmanImage.value = result['salesman']['avatar'].toString();

      //distributor
      distributorName.value = result['distributor']['name'].toString();
      distributorEmail.value = result['distributor']['email'].toString();
      distributorPhone.value = result['distributor']['phone'].toString();
      distributorStatus.value = result['distributor']['status'].toString();
      distributorImage.value = result['distributor']['avatar'].toString();

      //address
      addressName.value = result['address']['name'].toString();
      addressEmail.value = result['address']['email'].toString();
      addressPhone.value = result['address']['phone'].toString();
      addressAddress.value = result['address']['address'].toString();
      addresslocality.value = result['address']['locality'].toString();
      addressCity.value = result['address']['city'].toString();
      addressState.value = result['address']['state'].toString();
      addressCountry.value = result['address']['country'].toString();
      addressPincode.value = result['address']['pin_code'].toString();
      addressType.value = result['address']['type'].toString();
    }
  }

}