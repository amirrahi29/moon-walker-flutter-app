import 'package:get/get.dart';
import 'package:moon_walker/model/WislistModel.dart';
import 'package:moon_walker/repository/ProductRepository.dart';
import 'package:moon_walker/view_model/MainViewModel.dart';

class WishlistViewModel extends GetxController{

  var wishlistId = "".obs;
  var wishlistList = <WishlistProduct>[].obs;
  var searchWishlistList = <WishlistProduct>[].obs;
  final mainViewModel = Get.put(MainViewModel());
  var isWishlistAvailable = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    allWishlist();
  }

  deleteWishlist(String productId)async{
    mainViewModel.setMainLoader(true);
    var result = await ProductRepository.deleteWishlist(productId);
    if(result == true){
      allWishlist();
      mainViewModel.setMainLoader(false);
      Get.back();
    }else{
      mainViewModel.setMainLoader(false);
      Get.back();
    }
  }

  allWishlist()async{
    isWishlistAvailable.value = 0;
    searchWishlistList.clear();
    wishlistList.clear();
    var result = await ProductRepository.wishlistRepo();
    if(result.isNotEmpty){
      isWishlistAvailable.value = 1;
      for(var u in result){
        wishlistList.add(
            WishlistProduct(
              cartId: u["id"],
              id: u['product']["id"],
              name: u['product']["name"],
              price: u['product']["price"].toDouble(),
              compareAtPrice: u['product']["compare_at_price"],
              totalQuantity: u['product']["total_quantity"],
              image: u['product']["image"],
            )
        );
      }
      searchWishlistList.addAll(wishlistList);
    }else if(result.isEmpty){
      isWishlistAvailable.value = 2;
    }
    else{
      isWishlistAvailable.value = 0;
    }
  }

  searchOrders(String text)async{
    searchWishlistList.clear();
    if(text.isEmpty){
      wishlistList.forEach((element) {
        searchWishlistList.add(element);
      });
    }
    else{
      wishlistList.forEach((element) {
        if(element.name!.toLowerCase().contains(text)
            || element.price.toString().toLowerCase().contains(text))
        {
          searchWishlistList.add(element);
        }
      });
    }
  }

  Future<Null> refreshList() async {
    mainViewModel.setMainLoader(false);
    await Future.delayed(Duration(seconds: 2));
    allWishlist();
    return null;
  }

}