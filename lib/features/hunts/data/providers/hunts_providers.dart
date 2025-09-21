import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../hunts_api.dart';
import '../models/hunt_models.dart';

final huntsApiServiceProvider = Provider<HuntsApiService>((ref) {
  final apiHandler = ref.read(apiHandlerProvider);
  return HuntsApiService(apiHandler);
});

final createHuntProvider = FutureProvider.autoDispose.family<HuntOut, HuntCreate>((ref, huntCreate) async {
  final huntsApiService = ref.read(huntsApiServiceProvider);
  return huntsApiService.createHunt(huntCreate);
});

final getHuntsProvider = FutureProvider.autoDispose.family<List<HuntOut>, ({int limit, int offset})>((ref, params) async {
  final huntsApiService = ref.read(huntsApiServiceProvider);
  return huntsApiService.getHunts(limit: params.limit, offset: params.offset);
});

final getHuntByIdProvider = FutureProvider.autoDispose.family<HuntOut, String>((ref, huntId) async {
  final huntsApiService = ref.read(huntsApiServiceProvider);
  return huntsApiService.getHuntById(huntId);
});

final updateHuntProvider = FutureProvider.autoDispose.family<HuntOut, ({String huntId, HuntUpdate huntUpdate})>((ref, params) async {
  final huntsApiService = ref.read(huntsApiServiceProvider);
  return huntsApiService.updateHunt(params.huntId, params.huntUpdate);
});

final deleteHuntProvider = FutureProvider.autoDispose.family<void, String>((ref, huntId) async {
  final huntsApiService = ref.read(huntsApiServiceProvider);
  return huntsApiService.deleteHunt(huntId);
});