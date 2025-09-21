import '../../../core/network/api_handler.dart';
import '../../../core/network/endpoints.dart';
import 'models/hunt_models.dart';

class HuntsApiService {
  final ApiHandler _apiHandler;

  HuntsApiService(this._apiHandler);

  Future<HuntOut> createHunt(HuntCreate huntCreate) async {
    return _apiHandler.post<HuntOut>(
      Endpoints.hunts,
      body: huntCreate.toJson(),
      parser: (data) => HuntOut.fromJson(data),
    );
  }

  Future<List<HuntOut>> getHunts({int limit = 50, int offset = 0}) async {
    return _apiHandler.get<List<HuntOut>>(
      Endpoints.hunts,
      queryParameters: {'limit': limit, 'offset': offset},
      parser: (data) => (data as List).map((e) => HuntOut.fromJson(e)).toList(),
    );
  }

  Future<HuntOut> getHuntById(String huntId) async {
    final endpoint = Endpoints.huntById.replaceAll('{hunt_id}', huntId);
    return _apiHandler.get<HuntOut>(
      endpoint,
      parser: (data) => HuntOut.fromJson(data),
    );
  }

  Future<HuntOut> updateHunt(String huntId, HuntUpdate huntUpdate) async {
    final endpoint = Endpoints.huntById.replaceAll('{hunt_id}', huntId);
    return _apiHandler.patch<HuntOut>(
      endpoint,
      body: huntUpdate.toJson(),
      parser: (data) => HuntOut.fromJson(data),
    );
  }

  Future<void> deleteHunt(String huntId) async {
    final endpoint = Endpoints.huntById.replaceAll('{hunt_id}', huntId);
    return _apiHandler.delete<void>(endpoint);
  }
}
