import 'MySharedPrefManager.dart';


class FavoritesHandler{

  static Future<Null> toggleFavButton(String key) async {
    bool isPresent = await MySharedPreferenceManager.isValuePresent(key);
    if (isPresent) {
      print('disLiked');
      MySharedPreferenceManager.removePreference(key);

    } else {
      print('Liked');
      MySharedPreferenceManager.savePreference(key,key);

    }
  }


}

//Saving liked items locally in sharedPreferences
