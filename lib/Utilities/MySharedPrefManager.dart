import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferenceManager{

  static Future<bool>savePreference(String key, String value) async{
    bool isSaved;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value).then((value) => isSaved=value);
    return isSaved;
  }
 static  Future<bool> getPreference(String key)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return(sharedPreferences.get(key));



  }
  static Future<bool> isValuePresent(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey(key);
  }
  static Future<bool> removePreference(String key)async{
    bool isRemoved;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key).then((value) => isRemoved = value);
    return isRemoved;
  }

}