// features/hunts/data/hunt_api.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_handler.dart';
import 'models/hunt_model.dart';

part 'hunts_api.g.dart';

class HuntsApi {
  final ApiHandler _client;
  HuntsApi(this._client);

  Future<List<Hunt>> fetchHunts() {
    return _client.get<List<Hunt>>(
      '/hunts',
      parser: (data) =>
          (data as List).map((e) => Hunt.fromJson(e)).toList(),
    );
  }
}

@riverpod
HuntsApi huntApi(Ref ref) {
  final client = ref.watch(apiHandlerProvider);
  return HuntsApi(client);
}
