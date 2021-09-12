import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_demo/service_locator.dart';
import 'package:scoped_model_demo/services/storage_service.dart';
import 'package:scoped_model_demo/enums/view_states.dart';

import 'base_model.dart';

class HomeModel extends BaseModel {
  StorageService storageService = locator<StorageService>();
  String title = "HomeModel";

  Future<bool> saveData() async {
    setState(ViewState.Busy);
    setTitle("Saving Data");
    await storageService.saveData();
    setTitle("Data Saved");
    setState(ViewState.Retrieved);

    return true;
  }

  void setTitle(String value) {
    title = value;
    notifyListeners();
  }
}
