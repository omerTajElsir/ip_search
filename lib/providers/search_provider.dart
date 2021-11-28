import 'package:flutter/cupertino.dart';
import 'package:ip_search/repositories/ip_api_client.dart';

import '../models/data_model.dart';



class SearchProvider with ChangeNotifier {
  IpApiClient apiClient = IpApiClient();

  DataModel? response;


  String? error;

  bool isSearching = false;

  String? imageAsset;

  Future<DataModel> getIp() async {
    isSearching = true;
    notifyListeners();
    try {
      final data = await apiClient.fetchIP();
      response = data;
      isSearching = false;
      error = null;

      notifyListeners();

      return data;
    } catch (e) {
      error = e.toString();
      response = null;
      isSearching = false;

      notifyListeners();

      throw e;
    }
  }


  void clearSearch() {
    error = null;
    response = null;

    notifyListeners();
  }
}
