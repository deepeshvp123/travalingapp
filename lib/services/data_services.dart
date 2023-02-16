import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travalingapp/model/data_model.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getinfo() async {
    var apiurl = "/getplaces";
    http.Response res = await http.get(Uri.parse(baseUrl + apiurl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
