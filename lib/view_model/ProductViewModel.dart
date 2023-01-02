import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/model/ColorsModel.dart';
import 'package:moon_walker/model/ProductDetailsModel.dart';
import 'package:moon_walker/model/ProductModel.dart';
import 'package:moon_walker/model/SetModel.dart';
import 'package:moon_walker/model/SizeModel.dart';
import 'package:moon_walker/repository/CartRepository.dart';
import 'package:moon_walker/repository/ProductRepository.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/ProductComponents.dart';
import 'package:moon_walker/view_model/CartViewModel.dart';
import 'package:moon_walker/view_model/DashboardViewModel.dart';

class ProductViewModel extends GetxController{

  final dashboardViewModel = Get.put(DashboardViewModel());
  final cartViewModel = Get.put(CartViewModel());
  var productList = <ProductMainModel>[].obs;
  var searchProductList = <ProductMainModel>[].obs;
  var productDetail = <ProductDetailsModel>[].obs;
  var productDetailColors = <ColorsModel>[].obs;
  var productDetailSizes = <SizeModel>[].obs;
  var productDetailImages = <String>[].obs;
  var productCoreSizes = <SizeModel>[].obs;
  var productFashionSizes = <String>[].obs;
  var selectedColor = "".obs;
  //sets lists
  var setAList = <SetModel>[].obs;
  var setBList = <SetModel>[].obs;
  var setCList = <SetModel>[].obs;

  //
  var isProductLoader = false.obs;
  var isSizeSetId = "0".obs;
  var myQtyCounterValue = 0.obs;
  var myCoreQtyCounterValue = 1.obs;

  var isSelectedSelectAllBtn = false.obs;
  var collectionID = 0.obs;
  var setId = 0.obs;
  var sortId = 0.obs;
  var brandId = <int>[].obs;
  var search = "".obs;
  var productIdForWishlist = "".obs;
  var categoryIdForWishlist = "".obs;

  var isFashionSelectedList = <String>[].obs;

  //sizes product details fashion start

  //fashion sets
  var S = 0.obs;
  var M = 0.obs;
  var L = 0.obs;
  var XL = 0.obs;
  var TWOXL = 0.obs;
  var THREEXL = 0.obs;
  var FOURXL = 0.obs;
  var FIVEXL = 0.obs;

  // //core sets
  var S1 = 0.obs;
  var M1 = 0.obs;
  var L1 = 0.obs;
  var XL1 = 0.obs;
  var TWOXL1 = 0.obs;
  var THREEXL1 = 0.obs;
  var FOURXL1 = 0.obs;
  var FIVEXL1 = 0.obs;

  var isProductAvailable = 0.obs;
  //sizes product details fashion end

  var isSearchEnabled = false.obs;
  var page = 0.obs;

  //pagination
  final PagingController<int, dynamic> pagingController = PagingController(firstPageKey: 0);

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      page.value++;
      setCollectionId(
          collectionID.value,
          setId.value,
          sortId.value,
          search.value,
          brandId.value,
          page.toString()
      );
    });
  }

  @override
  void dispose() {
    searchProductList.clear();
    productList.clear();
    pagingController.dispose();
    super.dispose();
  }

  setClearId(){
    setId.value = 0;
    sortId.value = 0;
    brandId.value = [];
    search.value = "";
  }

  selectAllCoreSizes(){
    myCoreQtyCounterValue.value = 1;
    if(productCoreSizes.isNotEmpty){
      productCoreSizes.clear();
      isSelectedSelectAllBtn.value = false;
    }else{
      isSelectedSelectAllBtn.value = true;
      productCoreSizes.addAll(productDetailSizes);
     for(var u in productDetailSizes){
       if(u.size == "S" && int.parse(u.total_quantity.toString()) > 0){
         S1.value = myCoreQtyCounterValue.value;
       }
       else if(u.size == "M" && int.parse(u.total_quantity.toString()) > 0){
         M1.value = myCoreQtyCounterValue.value;
       }
       else if(u.size == "L" && int.parse(u.total_quantity.toString()) > 0){
         L1.value = myCoreQtyCounterValue.value;
       }
       else if(u.size == "XL" && int.parse(u.total_quantity.toString()) > 0){
         XL1.value = myCoreQtyCounterValue.value;
       }
       else if(u.size == "2XL" && int.parse(u.total_quantity.toString()) > 0){
         TWOXL1.value = myCoreQtyCounterValue.value;
       }
       else if(u.size == "3XL" && int.parse(u.total_quantity.toString()) > 0){
         THREEXL1.value = myCoreQtyCounterValue.value;
       }
       else if(u.size == "4XL" && int.parse(u.total_quantity.toString()) > 0){
         FOURXL1.value = myCoreQtyCounterValue.value;
       }
       else if(u.size == "5XL" && int.parse(u.total_quantity.toString()) > 0){
         FIVEXL1.value = myCoreQtyCounterValue.value;
       }
     }
    }
  }

  addCoreSize(SizeModel mySize){

    if(mySize.size == "S" && int.parse(mySize.total_quantity.toString()) > 0){
      S1.value = myCoreQtyCounterValue.value;
    }
    else if(mySize.size == "M" && int.parse(mySize.total_quantity.toString()) > 0){
      M1.value = myCoreQtyCounterValue.value;
    }
    else if(mySize.size == "L" && int.parse(mySize.total_quantity.toString()) > 0){
      L1.value = myCoreQtyCounterValue.value;
    }
    else if(mySize.size == "XL" && int.parse(mySize.total_quantity.toString()) > 0){
      XL1.value = myCoreQtyCounterValue.value;
    }
    else if(mySize.size == "2XL" && int.parse(mySize.total_quantity.toString()) > 0){
      TWOXL1.value = myCoreQtyCounterValue.value;
    }
    else if(mySize.size == "3XL" && int.parse(mySize.total_quantity.toString()) > 0){
      THREEXL1.value = myCoreQtyCounterValue.value;
    }
    else if(mySize.size == "4XL" && int.parse(mySize.total_quantity.toString()) > 0){
      FOURXL1.value = myCoreQtyCounterValue.value;
    }
    else if(mySize.size == "5XL" && int.parse(mySize.total_quantity.toString()) > 0){
      FIVEXL1.value = myCoreQtyCounterValue.value;
    }

    myCoreQtyCounterValue.value = 1;
    if(productCoreSizes.contains(mySize)){
      productCoreSizes.remove(mySize);
    }
    else{
      productCoreSizes.add(mySize);
    }
  }

  removeQuantityCounter(){
    if(isSizeSetId!="0"){
      if(myQtyCounterValue.value > 1){
        myQtyCounterValue.value = myQtyCounterValue.value-1;
        S.value = S.value-1;
      }else{
        S.value = S.value+1;
      }
    }
    else{
      GlobalEquipments.SnackToastFailed("Size Set", "No size set selected!");
    }

  }

  addQuantityCounter(){
    if(isSizeSetId!="0")
    {
      myQtyCounterValue.value = myQtyCounterValue.value+1;
      S.value = S.value+1;
    }
    else{
      GlobalEquipments.SnackToastFailed("Size Set", "No size set selected!");
    }
  }

  removeCoreQuantityCounter(){
    if(productCoreSizes.isNotEmpty){
      if(myCoreQtyCounterValue.value > 1){
        myCoreQtyCounterValue.value = myCoreQtyCounterValue.value-1;
      }
    }
    else{
      GlobalEquipments.SnackToastFailed("Size Set", "No size set selected!");
    }

  }

  addCoreQuantityCounter(){
    if(productCoreSizes.isNotEmpty)
    {
      myCoreQtyCounterValue.value = myCoreQtyCounterValue.value+1;
    }
    else{
      GlobalEquipments.SnackToastFailed("Size Set", "No size set selected!");
    }
  }

  setSizeSet(String sizeSetId){
    isSizeSetId.value = sizeSetId;
    if(!isFashionSelectedList.contains(sizeSetId)){
      isFashionSelectedList.add(sizeSetId);

      //print(sizeSetId);

      clearAllDataOfSizes();

      if(sizeSetId == "1") {
        for (var u in setAList) {
          // print("size: ${u.size}, quantity: ${u.quantity}");
          if(u.size == 'S' && u.quantity! >= myQtyCounterValue.value){
            S.value = myQtyCounterValue.value+1;
          }
          if(u.size == 'M' && u.quantity! >= myQtyCounterValue.value){
            M.value = myQtyCounterValue.value+1;
          }
          if(u.size == 'L' && u.quantity! >= myQtyCounterValue.value){
            L.value = myQtyCounterValue.value+1;
          }
          if(u.size == 'XL' && u.quantity! >= myQtyCounterValue.value){
            XL.value = myQtyCounterValue.value+1;
          }
        }
      }
      else if(sizeSetId == "2") {
        for (var u in setBList) {
          if(u.size == 'M' && u.quantity! > myQtyCounterValue.value){
            M.value = 1;
          }
          else if(u.size == 'L' && u.quantity! > myQtyCounterValue.value){
            L.value = 1;
          }
          else if(u.size == 'XL' && u.quantity! > myQtyCounterValue.value){
            XL.value = 1;
          }
          else if(u.size == '2XL' && u.quantity! > myQtyCounterValue.value){
            TWOXL.value = 1;
          }
        }
      }
      else if(sizeSetId == "3") {
        for (var u in setCList) {
          if(u.size == '2XL' && u.quantity! > myQtyCounterValue.value){
            TWOXL.value = 1;
          }
          else if(u.size == '3XL' && u.quantity! > myQtyCounterValue.value){
            THREEXL.value = 1;
          }
          else if(u.size == '4XL' && u.quantity! > myQtyCounterValue.value){
            FOURXL.value = 1;
          }
          else if(u.size == '5XL' && u.quantity! > myQtyCounterValue.value){
            FIVEXL.value = 1;
          }
        }
      }

    }else{
      isFashionSelectedList.remove(sizeSetId);
      // print(isFashionSelectedList);
    }
  }

  clearAllDataOfSizes(){
    //fashiion
    S.value=0;
    M.value=0;
    L.value=0;
    XL.value=0;
    TWOXL.value = 0;
    THREEXL.value = 0;
    FOURXL.value = 0;
    FIVEXL.value = 0;

    //core
    S1.value=0;
    M1.value=0;
    L1.value=0;
    XL1.value=0;
    TWOXL1.value = 0;
    THREEXL1.value = 0;
    FOURXL1.value = 0;
    FIVEXL1.value = 0;
  }

  setSelectedColor(String selectedCol){
    selectedColor.value = selectedCol;
  }

  setCollectionId(int collectionId,int sets, int sorts, String search,List<int> brandId, String page) async{
    pagingController.removePageRequestListener((pageKey) {
      productList.clear();
      searchProductList.clear();
    });
    isProductAvailable.value = 0;
    collectionID.value = collectionId;
    if(isSearchEnabled.value == false)
      {
        productList.clear();
        searchProductList.clear();
      }
    var result = await ProductRepository.getAllProducts(collectionId,sets,sorts,search,brandId,page);
    if(result.isNotEmpty){
      productList.value = result;
      searchProductList.addAll(productList);
      isProductAvailable.value = 1;
      pagingController.appendPage(searchProductList, int.parse(page));
    }else if(result.isEmpty){
      isProductAvailable.value = 2;
    }
    else{
      isProductAvailable.value = 0;
    }
  }

  searchCollectionRelatedProduct(String search,String page) async{
    pagingController.removePageRequestListener((pageKey) {
      productList.clear();
      searchProductList.clear();
    });
    isProductAvailable.value = 0;
    productList.clear();
    searchProductList.clear();
    var result = await ProductRepository.getAllSearchProducts(search, page);
    if(result.isNotEmpty){
      productList.value = result;
      searchProductList.addAll(productList);
      isProductAvailable.value = 1;
      pagingController.appendPage(searchProductList, int.parse(page));
    }else if(result.isEmpty){
      isProductAvailable.value = 2;
    }
    else{
      isProductAvailable.value = 0;
    }
  }

  getProductDetailsVm(int productId,String myColor)async {
    productDetail.clear();
    productDetailImages.clear();
    productDetailColors.clear();
    productDetailSizes.clear();

    var result = await ProductRepository.getProductDetailsRepo(productId,myColor);
    if (result != null) {
      productIdForWishlist.value = result['product']['id'].toString();
      categoryIdForWishlist.value = result['product']['category_id'].toString();
      //details
      ProductDetailsModel productDetailsModel = ProductDetailsModel();
      productDetailsModel.id = result['product']['id'];
      productDetailsModel.articleNo = result['product']['article_no'];
      productDetailsModel.seasonYear = result['product']['season_year'];
      productDetailsModel.categoryId = result['product']['category_id'];
      productDetailsModel.name = result['product']['name'];
      productDetailsModel.url = result['product']['url'];
      productDetailsModel.price = result['product']['price'];
      productDetailsModel.compareAtPrice =
      result['product']['compare_at_price'];
      productDetailsModel.sku = result['product']['sku'];
      productDetailsModel.barcode = result['product']['barcode'];
      productDetailsModel.options = result['product']['options'];
      productDetailsModel.quantity = result['product']['quantity'];
      productDetailsModel.tagLine = result['product']['tag_line'];
      productDetailsModel.description = result['product']['description'];
      productDetailsModel.timerTime = result['product']['timer_time'];
      productDetailsModel.timerDate = result['product']['timer_date'];
      productDetailsModel.timer = result['product']['timer'];
      productDetailsModel.weight = result['product']['weight'];
      productDetailsModel.shipping = result['product']['shipping'];
      productDetailsModel.sellOutOfStock =
      result['product']['sell_out_of_stock'];
      productDetailsModel.trackQuantity = result['product']['track_quantity'];
      productDetailsModel.contactUs = result['product']['contact_us'];
      productDetailsModel.howToGetThere = result['product']['how_to_get_there'];
      productDetailsModel.safetyStandards =
      result['product']['safety_standards'];
      productDetailsModel.overview = result['product']['overview'];
      productDetailsModel.highlight = result['product']['highlight'];
      productDetailsModel.additionalInformation =
      result['product']['additional_information'];
      productDetailsModel.ingredient = result['product']['ingredient'];
      productDetailsModel.recommended = result['product']['recommended'];
      productDetailsModel.benefits = result['product']['benefits'];
      productDetailsModel.forwardBooking = result['product']['forward_booking'];
      productDetailsModel.mostViewed = result['product']['most_viewed'];
      productDetailsModel.maxBought = result['product']['max_bought'];
      productDetailsModel.mostLiked = result['product']['most_liked'];
      productDetailsModel.metaTitle = result['product']['meta_title'];
      productDetailsModel.metaKeywords = result['product']['meta_keywords'];
      productDetailsModel.metaDescription =
      result['product']['meta_description'];
      productDetailsModel.status = result['product']['status'];
      productDetailsModel.totalQuantity = result['product']['total_quantity'];
      productDetailsModel.image = result['product']['image'];
      productDetail.add(productDetailsModel);
      //

      //images
      for (var u in result['images']['product']) {
        productDetailImages.add(u);
      }
      //

      //colors

      for (var v in result['colors']) {
        productDetailColors.add(ColorsModel(
          color: v['color'],
          color_image: v['color_image'],
          color_code: v['color_code'],
          status: v['status'],
          price: v['price'],
          compare_at_price: v['compare_at_price'],
          total_quantity: v['total_quantity'],
          image: v['image'],
        ));
        //
      }

      //sizes
      if(result['sizes'] != null)
      for (var v in result['sizes']) {
        productDetailSizes.add(SizeModel(
          size: v['size'],
          status: v['status'],
          price: v['price'],
          compare_at_price: v['compare_at_price'],
          total_quantity: v['total_quantity'],
          image: v['image'],
        ));
      }
      //
    }
  }

  getSizePopUpDetails(BuildContext context)async{

    isSizeSetId.value = "0";
    myQtyCounterValue.value = 0;
    productCoreSizes.clear();

    if(selectedColor.isEmpty){
      GlobalEquipments.SnackToastFailed("Colors error", "Please select atleast one color.");
    }else{
      setAList.clear();
      setBList.clear();
      setCList.clear();
      isProductLoader.value = true;
      var result = await ProductRepository.getAllProductSets(productDetail[0].id.toString(),selectedColor.toString());

      for(var u in result['Set A'])
        {
          setAList.add(SetModel(
            size: u['size'],
            quantity: u['quantity'],
            price: u['price'],
            compare_at_price: u['compare_at_price'],
            status: u['status'],
          ));
        }
      for(var u in result['Set B'])
      {
        setBList.add(SetModel(
          size: u['size'],
          quantity: u['quantity'],
          price: u['price'],
          compare_at_price: u['compare_at_price'],
          status: u['status'],
        ));
      }

      for(var u in result['Set C'])
      {
        setCList.add(SetModel(
          size: u['size'],
          quantity: u['quantity'],
          price: u['price'],
          compare_at_price: u['compare_at_price'],
          status: u['status'],
        ));
      }

      print(setAList);
      print(setBList);
      print(setCList);

      if(setAList.isNotEmpty && setBList.isNotEmpty && setCList.isNotEmpty){
        isProductLoader.value = false;
        ProductComponents.displaySortBottomPopup(context);
      }

    }
  }

  addCoreCart()async{
    var result = await CartRepo.addCoreCart(
        myCoreQtyCounterValue.value.toString(),
        productCoreSizes.value,
        productDetail[0].id!
    );
    if(result == true){
      Get.back();
      cartViewModel.getAllCartItems();
      GlobalEquipments.SnackToastSuccess("My Cart", "Product added into cart!");
      Get.toNamed(RoutesGetters.getCartRoute());
    }
    else{
      GlobalEquipments.SnackToastFailed("Product addition failed", "Something went wrong, Please try again!");
    }
  }

  addFashionCart() async{
    var result = await CartRepo.addFashionCart(
        myQtyCounterValue.value.toString(),
        productFashionSizes.value,
        productDetail[0].id!,
        categoryIdForWishlist.value,
        selectedColor.value
    );
    if(result == true){
      GlobalEquipments.SnackToastSuccess("My Cart", "Product added into cart!");
      Get.back();
      Get.toNamed(RoutesGetters.getCartRoute());
    } else{
      GlobalEquipments.SnackToastFailed("Product addition failed", "Something went wrong, Please try again!");
    }
  }

  Future<Null> refreshList() async {
    searchProductList.clear();
    productList.clear();
    await Future.delayed(Duration(seconds: 2));
    setCollectionId(collectionID.value,setId.value,sortId.value,search.value,brandId.value,"1");
    return null;
  }

  searchProduct(String text)async{
    searchProductList.clear();
    if(text.isEmpty){
      productList.forEach((element) {
        searchProductList.add(element);
      });
    }
    else{
      productList.forEach((element) {
        if(element.product!.name!.toLowerCase().contains(text)
            || element.product!.price!.toString().toLowerCase().contains(text)
            || element.product!.totalQuantity.toString().toLowerCase().contains(text))
        {
          searchProductList.add(element);
        }
      });
    }
  }

  addWishlist()async{
    var result = await ProductRepository.addWishlist(productIdForWishlist.value);
    if(result == true){
      Get.toNamed(RoutesGetters.getWishlistRoute());
    }
  }


}