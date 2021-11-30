import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../../models/data_model.dart';

class IpApiClient {
  static const baseUrl = 'https://api.myip.com';


  Future<DataModel> fetchIP() async {
    //final ipURL = Uri.parse('$baseUrl');
    final ipResponse = await await Dio().get(baseUrl);
    if (ipResponse.statusCode != 200) {
      throw Exception(
          'There seems to be a problem in obtaining your IP.');
    }
    final ipJson = jsonDecode(ipResponse.data.toString());
    final consolidatedIP = ipJson as Map<String, dynamic>;

    final ip = DataModel.fromJson(consolidatedIP);
    return ip;
  }
}
