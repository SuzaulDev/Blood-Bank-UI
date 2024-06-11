import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseApiService {
  final String baseURL = "http://48.217.146.162:8080/";
 // final String baseURL = "http://localhost:8080/";

  Future<Map<String, String>> getHeaders({authToken}) async {
    // Implement logic to get authentication headers or other required headers
    if (authToken != null) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}'
        // Add more headers as needed
      };
    } else {
      return {
        'Content-Type': 'application/json',
        // Add more headers as needed
      };
    }
  }

  Future<dynamic> get({required String endpoint, token}) async {
    final response = await http.get(Uri.parse('$baseURL$endpoint'),
        headers: await getHeaders(authToken: token));
    return _handleResponse(response);
  }

  Future<dynamic> post(
      {required String endpoint, required dynamic data, token}) async {
    final response = await http.post(
      Uri.parse('$baseURL$endpoint'),
      headers: await getHeaders(authToken: token),
      body: json.encode(data),
    );
    return _handlePostResponse(response);
  }
  Future<dynamic> put(
      {required String endpoint, required dynamic data, token}) async {
    final response = await http.put(
      Uri.parse('$baseURL$endpoint'),
      headers: await getHeaders(authToken: token),
      body: json.encode(data),
    );
    return _handlePostResponse(response);
  }

  Future<dynamic> delete(
      {required String endpoint, required dynamic data, token}) async {
    final response = await http.delete(
      Uri.parse('$baseURL$endpoint'),
      headers: await getHeaders(authToken: token),
      body: jsonEncode(data),
    );

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      // Successful response
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      // Error response
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  dynamic _handlePostResponse(http.Response response) {
    if (response.statusCode == 200) {
      // Successful response
      return json.decode(response.body);
    } else {
      // Error response
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
