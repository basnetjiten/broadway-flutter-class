import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class HiveUtils {
  static Box? _ourDataBase;

  static initDb() async{
   // _ourDataBase = Hive.box('movieDB');
    final dbDir = await getApplicationDocumentsDirectory();

    Hive.init(dbDir.path);

    _ourDataBase = await Hive.openBox('movieDB');

  }

  static setString(String key, String value){
    _ourDataBase?.put(key, value);
  }

  static String getString(String key){
    return _ourDataBase?.get(key);
  }
}
