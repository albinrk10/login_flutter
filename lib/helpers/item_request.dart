import 'dart:convert';
import 'dart:developer';

import 'package:albin_abx/helpers/base_request.dart';

import 'models/item.dart';

import 'package:http/http.dart' as http;

class RequestItem implements HTTPRequest<Item> {
  final String url;
  final String urlPrueba = "https://jsonplaceholder.typicode.com/posts";
  const RequestItem({required this.url});

  @override
  Future<List<Item>> execute() async {
    final response = await http.get(Uri.parse(urlPrueba));

    if (response.statusCode != 200) {
      throw http.ClientException('Error con los datos');
    }
    if (response.statusCode == 200) {
      log("succesful");
      response.body;
    }
    return _parseJson(response.body);
  }

  List<Item> _parseJson(String response) {
    return List<Item>.from(jsonDecode(response)
        .map((json) => Item.fromJson(json))); //errror no carga

    // list<Item>

    //return Item.fromJson(json.decode(response)); no funciona
  }
}
