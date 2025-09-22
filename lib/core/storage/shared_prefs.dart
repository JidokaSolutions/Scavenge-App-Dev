import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedPrefDatabase {
  static late SharedPreferences sharedPreferences;

  static const _emailKey = 'emailKey';
  static const _managerDataKey = 'managerDataKey';
  static const _userDataKey = 'userDataKey';
  static const isLoginBoolKey = 'IsLoginBool';
  static const _selectedBranchId = 'selectedBranchId';
  static const _selectedBranchAddress = 'selectedBranchAddress';
  static const _selectedBranchPhone = 'selectedBranchPhone';

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // ------------------------- GENERIC HELPERS -------------------------

  static Future<bool> _setString(String key, String value) async => await sharedPreferences.setString(key, value);

  static String? _getString(String key) => sharedPreferences.getString(key);

  static Future<bool> _setBool(String key, bool value) async => await sharedPreferences.setBool(key, value);

  static bool _getBool(String key, {bool defaultValue = false}) => sharedPreferences.getBool(key) ?? defaultValue;

  // ------------------------- LOGIN -------------------------

  static Future<bool> setIsLoginBool(bool value) async => _setBool(isLoginBoolKey, value);

  static bool isLoggedIn() => _getBool(isLoginBoolKey);

  // ------------------------- MANAGER -------------------------

  // static Future<bool> setManagerData(ManagerModel manager) async => _setString(_managerDataKey, jsonEncode(manager.toJson()));
  //
  // static ManagerModel? getManagerData() {
  //   final json = _getString(_managerDataKey);
  //   if (json == null) return null;
  //   return ManagerModel.fromJson(jsonDecode(json));
  // }

  // ------------------------- USER -------------------------

  // static Future<bool> setUserData(UserModel user) async => _setString(_userDataKey, jsonEncode(user.toJson()));
  //
  // static UserModel? getUserData() {
  //   final json = _getString(_userDataKey);
  //   if (json == null) return null;
  //   return UserModel.fromJson(jsonDecode(json));
  // }

  // ------------------------- EMAIL -------------------------

  static Future<bool> setUserEmail(String email) async => _setString(_emailKey, email);

  static String? getUserEmail() => _getString(_emailKey);

  // ------------------------- BRANCH -------------------------

  static Future<bool> setSelectedBranchId(String branchId) async => _setString(_selectedBranchId, branchId);

  static String? getSelectedBranchId() => _getString(_selectedBranchId);

  static Future<bool> setSelectedBranchAddress(String branchAddress) async => _setString(_selectedBranchAddress, branchAddress);

  static String? getSelectedBranchAddress() => _getString(_selectedBranchAddress);

  static Future<bool> setSelectedBranchPhone(String branchPhone) async => _setString(_selectedBranchPhone, branchPhone);

  static String? getSelectedBranchPhone() => _getString(_selectedBranchPhone);

  // ------------------------- LOGOUT -------------------------

  static Future<void> logout() async {
    await sharedPreferences.remove(isLoginBoolKey);
    await sharedPreferences.remove(_managerDataKey);
    await sharedPreferences.remove(_userDataKey);
    await sharedPreferences.remove(_emailKey);
    await sharedPreferences.remove(_selectedBranchId);
    await sharedPreferences.remove(_selectedBranchAddress);
    await sharedPreferences.remove(_selectedBranchPhone);
  }
}
