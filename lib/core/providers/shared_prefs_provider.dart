import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be initialized in main()');
});

// Override this provider in main() after initialization
class SharedPrefsProviderOverride extends Override {
  final SharedPreferences sharedPreferences;

  SharedPrefsProviderOverride(this.sharedPreferences);

  @override
  ProviderBase get provider => sharedPreferencesProvider;

  @override
  Object? create() => sharedPreferences;
}