
import 'package:dro_health/services/hive_manager.dart';
import 'package:flutter/material.dart';

class HiveManagerProvider with ChangeNotifier{
  HiveManager _hiveManager = HiveManager();
  HiveManager get hiveManager => _hiveManager;
  int _pack = 1;
  int get pack=>_pack;
  void addPack(){
    _pack+=1;
    notifyListeners();
  }
  void removePack(){
    if(_pack==1)return;
    _pack-=1;
    notifyListeners();
  }
}