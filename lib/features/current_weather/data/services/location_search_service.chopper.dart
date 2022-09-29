// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_search_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$LocationSearchService extends LocationSearchService {
  _$LocationSearchService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = LocationSearchService;

  @override
  Future<Response<dynamic>> locationSearch(
    String cityName,
    String appid,
  ) {
    final $url = '/geo/1.0/direct?q=${cityName}&limit=1&appid=${appid}';
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
