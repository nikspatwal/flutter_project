// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$AllApi extends AllApi {
  _$AllApi([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = AllApi;

  Future<Response> login(String auth, Map map, String type) {
    final $url = '/api/user/sessions';
    final $headers = {'Authorization': auth, 'Content-Type': type};
    final $body = map;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> refreshToken(
      String refreshToken, String content, String accept, Map refreshTokenMap) {
    final $url = '/api/user/refreshtoken';
    final $headers = {
      'refresh-token': refreshToken,
      'Content-Type': content,
      'Accept': accept
    };
    final $body = refreshTokenMap;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> registerVisitor(String entityId, String xToken,
      String content, String accept, Map mobileNo) {
    final $url = '/api/entity/$entityId/visitor';
    final $headers = {
      'x-auth-token': xToken,
      'Content-Type': content,
      'Accept': accept
    };
    final $body = mobileNo;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> gateQuery(String xToken, String entityId, Map body) {
    final $url = '/api/entity/$entityId/gate/query';
    final $headers = {'x-auth-token': xToken};
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> visitorHistory(
      String entityId, String xToken, String content, String accept, Map body) {
    final $url = '/api/entity/$entityId/visitorhistory/query';
    final $headers = {
      'x-auth-token': xToken,
      'Content-Type': content,
      'Accept': accept
    };
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getVisitorImage(String entityId, String visitorId,
      String visitorHistoryId, String content, String xToken) {
    final $url =
        '/api/entity/$entityId/visitor/$visitorId/visitorhistory/$visitorHistoryId/image/';
    final $headers = {'Content-Type': content, 'x-auth-token': xToken};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
