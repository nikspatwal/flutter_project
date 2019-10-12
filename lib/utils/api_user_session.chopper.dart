// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_session.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$UserSession extends UserSession {
  _$UserSession([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = UserSession;

  Future<Response> login(String auth, Map map, String type) {
    final $url = '/api/user/sessions';
    final $headers = {'Authorization': auth,"Content-Type": type};
    final $body = map;
    final $request = Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic,dynamic>($request);
  }
}
