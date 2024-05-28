import 'package:http/http.dart';
import 'dart:convert';

class Network {
  Network(this.url);
  final url;
  Future<dynamic> getNetwork() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;

      var decodeData = jsonDecode(data);
      return decodeData;
    } else {
      return null;
    }
  }
}
