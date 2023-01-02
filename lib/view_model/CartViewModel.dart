import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/model/CartModel.dart';
import 'package:moon_walker/model/ColorsModel.dart';
import 'package:moon_walker/model/Distributor.dart';
import 'package:moon_walker/model/RsAddress.dart';
import 'package:moon_walker/model/SizeModel.dart';
import 'package:moon_walker/repository/CartRepository.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view_model/AddressViewModel.dart';
import 'package:moon_walker/view_model/MainViewModel.dart';

class CartViewModel extends GetxController{

  var isBillDetails = false.obs;
  var isDeliveryDetails = false.obs;
  var cartProductList = <CartProduct>[].obs;
  var custList = <Distributor>[].obs;
  var retilerAddressList = <RsAddress>[].obs;
  var distributorAddressList = <RsAddress>[].obs;
  final mainViewModel = Get.put(MainViewModel());
  final addressViewModel = Get.put(AddressViewModel());

  var TotalMRP = "".obs;
  var TotalDiscount = "".obs;
  var Total = "".obs;
  var retailer_discount = "".obs;
  var distributor_discount = "".obs;
  var retailer_subtotal = "".obs;
  var distributor_subtotal = "".obs;
  var customerType = "retailers".obs;

  var retailerId = 0.obs;
  var distributorId = 0.obs;
  var addressId = 0.obs;

  var allRetailersLists = <RetailerModel>[].obs;
  var allDistributorsLists = <DistributorModel>[].obs;

  var selectedRetailerId = "".obs;
  var selectedDistributorId = "".obs;
  var selectedRetailerName = "".obs;
  var selectedDistributorName = "".obs;

  var cartNotItemMsg = true.obs;
  var isCartAvailable = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCartItems();
    getCartBillDetails();
    getCustomers("retailers");
    getRetailerAddresses();
    getDistributorAddresses();
    getRetailers();
    getDistributors();
  }

  setSelectedRetailer(String id, String name){
    selectedRetailerId.value = id;
    selectedRetailerName.value = name;
    selectedDistributorName.value = "";
  }
  setSelectedDistributor(String id, String name){
    selectedDistributorId.value = id;
    selectedDistributorName.value = name;
  }

  setAdderssId(int id){
    addressId.value = id;
  }
  setDistributorId(int id){
    distributorId.value = id;
  }
  setRetailerId(int id){
    retailerId.value = id;
  }

  toggleBillDetails(bool isBill){
    isBillDetails.value = isBill;
  }

  toggleAddressDetails(bool isAddress){
    isDeliveryDetails.value = isAddress;
  }

  getAllCartItems() async{
    isCartAvailable.value = 0;
    cartProductList.clear();
    var result = await CartRepo.AllCart();
    if(result.isNotEmpty){
      isCartAvailable.value = 1;
      for(var u in result){
        var colorsList = <ColorsModel>[];
        var sizesList = <SizeModel>[];
        for(var s in u['size']){
          if(!sizesList.contains(s)){
            sizesList.add(SizeModel(
              productId: u['id'].toString(),
              size: s['size'],
              total_quantity: s['total_quantity'].toString(),
            ));
          }
        }
        for(var v in u['colors']){
          colorsList.add(ColorsModel(
            productId: u['id'].toString(),
            color: v['color'],
            color_code: v['color_code'],
          ));
        }
        cartProductList.add(
            CartProduct(
              id: u['id'],
              articleNo:u['product']['article_no'],
              totalQuantity:u['quantity'],
              image:u['product']['image'],
              price: u['product']['price'],
              compareAtPrice: u['product']['compare_at_price'],
              retailer_subtotal: u['retailer_subtotal'],
              distributor_subtotal: u['distributor_subtotal'],
              colors: colorsList,
              size: sizesList,
            )
        );
      }
    }
    else if(result.isEmpty){
      isCartAvailable.value = 2;
    }else{
      isCartAvailable.value = 0;
    }
   }

  getCartBillDetails() async{
    var result = await CartRepo.cartBillDetailsRepo();
    if(result != null){
      TotalMRP.value = result['TotalMRP'].toString();
      TotalDiscount.value = result['TotalDiscount'].toString();
      Total.value = result['Total'].toString();
      retailer_discount.value = result['retailer_discount'].toString();
      distributor_discount.value = result['distributor_discount'].toString();
      retailer_subtotal.value = result['retailer_subtotal'].toString();
      distributor_subtotal.value = result['distributor_subtotal'].toString();
    }
  }

  getRetailers() async{
    allRetailersLists.clear();
    var result = await CartRepo.retailerRepo();
    if(result != null){
      for(var u in result){
        allRetailersLists.add(RetailerModel(
          id: u["id"],
          name: u["name"],
          avatar: u["avatar"],
        ));
      }
    }
  }

  getDistributors() async{
    allDistributorsLists.clear();
    var result = await CartRepo.distributorRepo();
    if(result != null){
      for(var u in result){
        allDistributorsLists.add(DistributorModel(
          id: u["id"],
          name: u["name"],
          retailer_id: u["retailer_id"],
        ));
      }
    }
  }

  getCustomers(String type) async{
    customerType.value = type;
    custList.clear();
    var result = await CartRepo.cartCust(type);
    if(result != null){
      for(var u in result){
        custList.add(
            Distributor(
              id: u['id'],
              name: u['name'],
              avatar: u['avatar'],
            )
        );
      }
    }
  }

  getRetailerAddresses() async{
    retilerAddressList.clear();
    var result = await CartRepo.cartAddressCust("retailersAddress");
    if(result != null){
      for(var u in result){
        retilerAddressList.add(
            RsAddress(
              id: u["id"],
              userId: u["user_id"],
              name: u["name"],
              email: u["email"],
              phone: u["phone"],
              address: u["address"],
              locality: u["locality"],
              city: u["city"],
              state: u["state"],
              country: u["country"],
              pincode: u["pincode"],
            )
        );
      }
    }
  }
  getDistributorAddresses() async{
    distributorAddressList.clear();
    var result = await CartRepo.cartAddressCust("distributorsAddress");
    if(result != null){
      for(var u in result){
        distributorAddressList.add(
            RsAddress(
              id: u["id"],
              userId: u["user_id"],
              name: u["name"],
              email: u["email"],
              phone: u["phone"],
              address: u["address"],
              locality: u["locality"],
              city: u["city"],
              state: u["state"],
              country: u["country"],
              pincode: u["pincode"],
            )
        );
      }
    }
  }

  deleteFromCart(int productId, BuildContext context) async{
    mainViewModel.setMainLoader(true);
    var result = await CartRepo.destroyCart(productId);
    if(result == true){
      GlobalEquipments.SnackToastSuccess("My Cart", "Cart item deleted successfully.");
      mainViewModel.setMainLoader(false);
      getAllCartItems();
      getCartBillDetails();
    }else{
      GlobalEquipments.SnackToastSuccess("My Cart", "Cart item deletion failed!");
      mainViewModel.setMainLoader(false);
    }
  }

  checkout(BuildContext context)async{
    mainViewModel.setMainLoader(true);
    var result = await CartRepo.checkout(
        int.parse(selectedRetailerId.value),
        int.parse(selectedDistributorId.value),
        addressId.value
    );
    if(result == true){
      mainViewModel.setMainLoader(false);
      Get.offAllNamed(RoutesGetters.getOrderStatusRoute());
    }else{
      mainViewModel.setMainLoader(false);
    }
  }

}