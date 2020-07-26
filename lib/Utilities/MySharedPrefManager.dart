import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferenceManager{

  static Future<void>savePreference(String key, String value) async{
    bool isValueAlreadyPresent = await isValuePresent(key);
    if(!isValueAlreadyPresent){
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString(key, value);
    }


  }
 static  Future<bool> getPreference(String key)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return(sharedPreferences.get(key));

  }
  static Future<bool> isValuePresent(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey(key);
  }
  static Future<void> removePreference(String key)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }
  static Future<void> clearPreference()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

}