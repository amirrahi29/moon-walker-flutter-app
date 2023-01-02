import 'package:get/get.dart';
import 'package:moon_walker/model/BrandModel.dart';
import 'package:moon_walker/repository/FilterRepository.dart';

class FilterListViewModel extends GetxController{

  List filterList = [];
  var sortingList = <String>[].obs;
  var setList = <String>[].obs;
  var brandList = <BrandModel>[].obs;

  int get count => filterList.length;

  var setIdAdd = "".obs;
  var setSortIdAdd = "".obs;
  var setSearchIdAdd = "".obs;
  var allBrandIdList = <int>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sortingListVm();
    getAllSets();
    getAllBrands();
  }

  addSetId(int setId){
    setIdAdd.value = (setId+1).toString();
  }
  addSortId(int sortId){
    setSortIdAdd.value = (sortId+1).toString();
  }
  addSearchText(String text){

  }
  addSetBrandId(int brandID){
    allBrandIdList.add(brandID);
  }
  removeSetBrandId(int brandID){
    allBrandIdList.remove(brandID);
  }

  addItem(Object item){
    filterList.add(item);
    update();
  }

  removeItem(Object item){
    filterList.remove(item);
    update();
  }

  sortingListVm()async{
    sortingList.clear();
    var result = await FilterRepository.getAllSortings();
    if(result != null){
      sortingList.value = result;
    }
  }

  getAllSets()async{
    setList.clear();
    var result = await FilterRepository.getAllSets();
    if(result != null){
      setList.value = result;
    }
  }

  getAllBrands()async{
    brandList.clear();
    var result = await FilterRepository.getAllBrands();
    if(result != null){
      brandList.value = result;
      print(result);
    }
  }

}
