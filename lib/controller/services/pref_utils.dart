import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  //
  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  // Future<void> init() async {
  //   _sharedPreferences ??= await SharedPreferences.getInstance();
  //   print('SharedPreference Initialized');
  // }

  // Future<bool> clearPreferencesData() async {
  //   bool isOnboardingShowExists = _sharedPreferences!.containsKey('isOnboardingShow');
  //   bool? isOnboardingShowValue;
  //
  //   if (isOnboardingShowExists) {
  //     isOnboardingShowValue = getOnboarding();
  //     // isOnboardingShowValue = _sharedPreferences!.getBool('isOnboardingShow');
  //   }
  //
  //   bool result = await _sharedPreferences!.clear();
  //
  //   if (isOnboardingShowExists && isOnboardingShowValue != null) {
  //     await setOnboarding(isOnboardingShowValue);
  //     // await _sharedPreferences!.setBool('isOnboardingShow', isOnboardingShowValue);
  //   }

  //   return result;
  // }

  // TOKEN
  Future<bool> setAuthToken(String token) async {
    return _sharedPreferences!.setString('TOKEN', token);
  }

  String getAuthToken() {
    try {
      return _sharedPreferences!.getString('TOKEN') ?? '';
    } catch (e) {
      return '';
    }
  }
}
