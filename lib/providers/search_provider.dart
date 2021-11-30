import 'package:flutter/cupertino.dart';

import '../data/livedata/live_data.dart';
import '../data/livedata/ui_state.dart';
import '../data/repositories/ip_api_client.dart';
import '../models/data_model.dart';



class SearchProvider with ChangeNotifier {
  IpApiClient apiClient = IpApiClient();

  DataModel? response;


  String? error;

  bool isSearching = false;

  String? imageAsset;

  LiveData<UIState<DataModel>> _ipLiveData = LiveData<UIState<DataModel>>();


  LiveData<UIState<DataModel>> getIpLiveData (){
    return this._ipLiveData;
  }

  init(){
    _ipLiveData.setValue(Initial());
  }

  Future<DataModel> getIp() async {
    _ipLiveData.setValue(IsLoading());
    notifyListeners();
    try {
      final data = await apiClient.fetchIP();
      _ipLiveData.setValue(Success(data));

      notifyListeners();

      return data;
    } catch (e) {
      _ipLiveData.setValue(Failure(e.toString()));

      notifyListeners();

      throw e;
    }
  }


  void clearSearch() {
    _ipLiveData.setValue(Initial());

    notifyListeners();
  }
}
