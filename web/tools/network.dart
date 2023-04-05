import 'dart:async';
import 'dart:convert';
import 'dart:html';
import '../models/user_model.dart';

class Network {
  Network._();
  static final _instance = Network._();
  factory Network() => _instance;

  /// Get
  Future<String> get(String baseUrl, String path, [int? id]) async {
    return HttpRequest.request("$baseUrl$path/$id", method: "GET", requestHeaders: {"Content-type": "application/json; charset=UTF-8"}).then((response) => response.responseText!);
  }

  /// Post
  Future<String> post(String baseUrl, String path, Map<String, dynamic> body) async {
    return HttpRequest.request(baseUrl + path, method: "POST", sendData: body, requestHeaders: {"Content-type": "application/json; charset=UTF-8"}).then((response) => response.responseText!);
  }

  /// Put
  Future<String> put(String baseUrl, String path, int id, Map<String, dynamic> body) async {
    return HttpRequest.request("$baseUrl$path/$id", method: "PUT", sendData: body, requestHeaders: {"Content-type": "application/json; charset=UTF-8"}).then((response) => response.responseText!);
  }

  /// Patch
  Future<String> patch(String baseUrl, String path, int id, Map<String, dynamic> body) async {
    return HttpRequest.request("$baseUrl$path/$id", method: "PATCH", sendData: body, requestHeaders: {"Content-type": "application/json; charset=UTF-8"}).then((response) => response.responseText!);
  }


  /// Delete
  Future<String> delete(String baseUrl, String path, int id) async {
    return HttpRequest.request("$baseUrl$path/$id", method: "DELETE", requestHeaders: {"Content-type": "application/json; charset=UTF-8"}).then((response) => response.responseText!);

  }

  User parseOneUser(String data) {
    Map<String, Object?> user = jsonDecode(data);
    return User.fromJson(user);
  }
}

enum Api {
  users("/api/v2/users"),
  notes("/api/v2/notes");

  const Api(this.path);
  final String path;

  static final baseUrl = "https://642ce05cbf8cbecdb4f8cec2.mockapi.io";
}