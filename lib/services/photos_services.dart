import 'dart:convert';
import 'package:company/models/ProductModel.dart';
import 'package:http/http.dart' as http;

class PhotosServices {
  Future<ProductModel> get_model() async {
    final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/search?query=product&per_page=100'),
      headers: {
        'Authorization': '9YemcVfHqUO1qEJP7Y0E995BLNZctvbzi9A5iQtI2FAByjBbUT4ClXFY'
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
     // print(data);
      return ProductModel.fromJson(data);
    } else {
      throw Exception('Failed to load');
    }
  }
}
