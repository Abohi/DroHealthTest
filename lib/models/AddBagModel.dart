class AddBagModel{
  String drugPrice,drugImage,drugName;
  int packs;
  AddBagModel({this.drugPrice,this.drugImage,this.packs,this.drugName});
  Map<dynamic, dynamic> toMap()=>{
    "drugImage":drugImage,
    "drugPrice":drugPrice,
    "drugName":drugName,
    "packs":packs
  };

  AddBagModel.fromMap(Map<dynamic,dynamic>map){
    drugImage = map["drugImage"];
    drugPrice = map["drugPrice"];
    drugName = map["drugName"];
    packs = map["packs"];
  }
}