import 'package:flutter_app_template/utils/strings.dart';
import 'package:get_storage/get_storage.dart';

class StorageHelper {
  final GetStorage _box = GetStorage(Strings.appName);

  saveHighScore(int score) async {
    await _box.write("_high_score", score);
  }

  void deleteAllStorageData() {
    _box.erase();
  }

  int getHighScore() {
    return _box.hasData("_high_score") ? _box.read("_high_score") : 0;
  }
}
