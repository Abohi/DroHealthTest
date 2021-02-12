import 'package:dro_health/models/AddBagModel.dart';
import 'package:dro_health/models/ProductModel.dart';
import 'package:dro_health/utils/hive_constants.dart';
import 'package:hive/hive.dart';

class HiveManager{
  void closeHiveDb() async{

  }


  void addToBag(AddBagModel addBagModel){
    Box<Map<dynamic,dynamic>> saveBag = Hive.box<Map<dynamic,dynamic>>(bagBox);
    saveBag.add(addBagModel.toMap());
  }
  List<AddBagModel> getBags(){
    Box<Map<dynamic,dynamic>> getBag = Hive.box<Map<dynamic,dynamic>>(bagBox);
    Iterable bags = getBag.values;
    return bags.map((e) => AddBagModel.fromMap(e)).toList();
  }
  void saveProductList() async{
    Box<List<Map<String,dynamic>>> saveProducts = Hive.box<List<Map<String,dynamic>>>(productBox);
    List<Map<String,dynamic>> products = [ProductModel(drugImage: "assets/images/kezitil.png",drugName: "Kezitil 1",drugConstituent: "Cefurozime Axetil",drugSizeDescription: "Oral Suspension-125mg",drugPrice: "500",packSize: 1,soldBy: "Evans Phamaceticals",productTo: "Joan Phamacetical").toMap(),
      ProductModel(drugImage: "assets/images/kezitil2.png",drugName: "Kezitil 2",drugConstituent: "Cefurozime Axetil 2",drugSizeDescription: "Oral Suspension-925mg",drugPrice: "1500",packSize: 9,soldBy: "Edith Phamaceticals",productTo: "Mary Phamacetical").toMap(),
      ProductModel(drugImage: "assets/images/emcap.png",drugName: "EmCap",drugConstituent: "Cefurozime EmCap",drugSizeDescription: "EmCap Suspension-125mg",drugPrice: "500",packSize: 7,soldBy: "Gloria Phamaceticals",productTo: "Ariana Phamacetical").toMap(),
      ProductModel(drugImage: "assets/images/emcap.png",drugName: "EmCap 2",drugConstituent: "Cefurozime EmCap 2",drugSizeDescription: "EmCap Suspension-25mg",drugPrice: "500",packSize: 4,soldBy: "Sarah Phamaceticals",productTo: "Daniel Phamacetical").toMap(),
      ProductModel(drugImage: "assets/images/lokmal.png",drugName: "LokMal",drugConstituent: "Cefurozime Lokmal",drugSizeDescription: "LokMal Suspension-25mg",drugPrice: "200",packSize: 1,soldBy: "Evans Phamaceticals",productTo: "Joan Phamacetical").toMap(),
    ];
    saveProducts.put(productList, products);
  }

  List<ProductModel> getProductList(){
    Box<List<Map<String,dynamic>>> saveProducts = Hive.box<List<Map<String,dynamic>>>(productBox);
    return saveProducts.get(productList).cast<Map<String,dynamic>>().map((e) => ProductModel.fromMap(e)).toList();
  }

}