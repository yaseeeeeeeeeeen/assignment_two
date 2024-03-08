
import 'package:http/http.dart' as http;


class ApiServices {
 static Future<http.Response> getDatas(String url) async {
    final uri = Uri.parse(url);
    final response = http.get(uri);
    return response;
  }
}
