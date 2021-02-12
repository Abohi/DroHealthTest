class ProductModel{
  String drugName,drugConstituent,drugSizeDescription,drugImage,drugPrice,productTo,soldBy;
  int packSize;
  ProductModel({this.drugName,this.drugConstituent,this.drugSizeDescription,this.drugImage,this.drugPrice,this.packSize,this.productTo,this.soldBy});


  Map<String, dynamic> toMap()=>{
    "drugName":drugName,
    "drugConstituent":drugConstituent,
    "drugSizeDescription":drugSizeDescription,
    "drugImage":drugImage,
    "drugPrice":drugPrice,
    "packSize":packSize,
    "productTo":productTo,
    "soldBy":soldBy
  };

  ProductModel.fromMap(Map<String,dynamic>map){
    drugConstituent= map["drugConstituent"];
    drugName = map["drugName"];
    drugSizeDescription = map["drugSizeDescription"];
    drugImage = map["drugImage"];
    drugPrice = map["drugPrice"];
    packSize=map["packSize"];
    productTo=map["productTo"];
    soldBy=map["soldBy"];
  }
}