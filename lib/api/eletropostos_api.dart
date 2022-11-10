import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stellantis/models/electropost.dart';

class EletropostosApi {
  final baseUrl = "https://eletroposto20221027133550.azurewebsites.net/api/eletroposto";

  Future<List<Eletroposto>> listElectroposts() async {
    //https://eletroposto20221027133550.azurewebsites.net/api/eletroposto
    final uri = baseUrl;
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      var listJson = jsonDecode(response.body);
      var eletropostos = listJson.map<Eletroposto>((json) => Eletroposto.fromJson(json)).toList();

      return eletropostos;
    }

    return [];
  }
}
