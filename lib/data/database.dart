import 'package:hive_flutter/hive_flutter.dart';

class WorkListDataBase {
  List WorkList = [];

  final _myBox = Hive.box('myBox');

  void createinitialData() {
    WorkList = [
      "Deneme Listesi Oluştur!",
      "Uygulamada kaydedilmesini istediğin görevleri ekle",
    ];
  }

  void loadData() {
    WorkList = _myBox.get("YAP");
  }

  void updateDataBase() {
    _myBox.put("YAP", WorkList);
  }
}
