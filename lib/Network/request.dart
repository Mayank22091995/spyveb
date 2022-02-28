import 'package:http/http.dart' as http;

class Request {
  final String? url;
  final dynamic body;

  Request({this.url, this.body});

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': '${Sharedpre.token}',
    //'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept'
  };

  Future<http.Response> post() {
    print(url);
    return http
        .post(Uri.parse(url!), headers: headers, body: body)
        .timeout(const Duration(minutes: 2));
  }

  Future<http.Response> get() {
    print(url);
    return http
        .get(Uri.parse(url!), headers: headers)
        .timeout(const Duration(minutes: 2));
  }
}
