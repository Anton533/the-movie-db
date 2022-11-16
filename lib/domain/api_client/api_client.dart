import 'dart:convert';
import 'dart:io';

class ApiClient {
  static String imageUrl(String path) {
    return '$_imageUrl$path';
  }

  final _client = HttpClient();
  //куда мы будем отправлять запросы, все запросы начинаются с этого урл
  static const _host = 'https://api.themoviedb.org/3';
  // если нужны картинки они лежат тут
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  // апи кей этот ключ в личном кабинете с помощью него можно работать с прогой
  static const _apiKey = '5eb1af50a385519917194d83bbebfab3';

  Future<String> auth({
    required String username,
    required String password,
  }) async {
    final token = await _makeToken();
    final validToken = await _validateUser(
      username: username,
      password: password,
      requestToken: token,
    );
    final sessionId = await _makeSession(requestToken: validToken);
    return sessionId;
  }

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<String> _makeToken() async {
    final url = _makeUri(
      '/authentication/token/new',
      {'api_key': _apiKey},
    );

    final request = await _client.getUrl(url);
    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    final token = json['request_token'] as String;
    return token;
  }

  Future<String> _validateUser({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    final url = _makeUri(
      '/authentication/token/validate_with_login',
      {'api_key': _apiKey},
    );

    final parameters = <String, dynamic>{
      'username': username,
      'password': password,
      'request_token': requestToken,
    };
    final request = await _client.postUrl(url);

    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    final token = json['request_token'] as String;
    return token;
  }

  Future<String> _makeSession({
    required String requestToken,
  }) async {
    final url = _makeUri(
      '/authentication/session/new',
      {'api_key': _apiKey},
    );

    final parameters = <String, dynamic>{
      'request_token': requestToken,
    };

    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    final sessionId = json['session_id'] as String;
    return sessionId;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => json.decode(value));
  }
}