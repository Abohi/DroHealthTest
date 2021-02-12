import 'package:dro_health/controllers/provider.dart';
import 'package:dro_health/services/hive_manager.dart';
import 'package:dro_health/utils/hive_constants.dart';
import 'package:dro_health/views/store_view/store_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox<List<Map<String,dynamic>>>(productBox);
  await Hive.openBox<Map<dynamic,dynamic>>(bagBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DRO HEALTH',
      home: ChangeNotifierProvider.value(child: StoreView(),
      value: HiveManagerProvider()..hiveManager.saveProductList(),),
      debugShowCheckedModeBanner: false,
    );
  }
}


