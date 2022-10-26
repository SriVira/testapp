// ignore_for_file: file_names, prefer_interpolation_to_compose_strings
import 'package:http/http.dart';

// http post request
Future<Response> postRequest(String url, Object body, {String? token}) async {
  return await post(Uri.parse(url),
      body: body,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'});
}

// http get request
Future<Response> getRequest(String url, {String? token}) async {
  return await get(Uri.parse(url),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'});
}