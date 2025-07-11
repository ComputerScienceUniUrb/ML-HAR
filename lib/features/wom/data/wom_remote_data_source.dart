import 'package:aifit/constants.dart';
import 'package:aifit/features/wom/data/wom_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wom_remote_data_source.g.dart';

@riverpod
Dio getDio(Ref ref) {
  return Dio();
}

@riverpod
WomRemoteDataSource getWomRemoteDataSource(Ref ref) {
  return WomRemoteDataSource(dio: ref.watch(getDioProvider));
}

class WomRemoteDataSource {
  final Dio _dio;

  WomRemoteDataSource({required Dio? dio}) : _dio = dio ?? Dio();

  Future<WomResponse> getWom(int womCount) async {
    const String endpointUrl =
        'https://wom.social/api/v1/source/$sourceId/vouchers';

    final String timestamp = DateTime.now().toUtc().toIso8601String();

    final requestBody = <String, dynamic>{
      'vouchers': [
        {
          'count': womCount,
          'aim': 'PR',
          'location': {
            'latitude': 0,
            'longitude': 0,
          },
          'timestamp': timestamp,
          'creationMode': 'Standard',
        },
      ],
    };

    try {
      final response = await _dio.post(
        endpointUrl,
        options: Options(
          headers: {
            'X-WOM-ApiKey': womApiKey,
          },
        ),
        data: requestBody,
      );

      if (response.statusCode == 200 && response.data != null) {
        return WomResponse.fromMap(response.data as Map<String,dynamic>);
      } else {
        throw Exception('Errore dal server: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('Errore di rete in getWom: ${e.message}');
      throw Exception(
          'Errore di connessione. Controlla la tua rete e riprova.');
    } catch (e) {
      print('Errore generico in getWom: $e');
      throw Exception('Si è verificato un errore inaspettato.');
    }
  }
}
