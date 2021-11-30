import 'package:flutter/cupertino.dart';
import 'package:ip_search/data/livedata/ui_state.dart';

class LiveData<T extends UIState> with ChangeNotifier{
  late T value;

  void setValue (T value){
    this.value = value;
    //notifyListeners();
  }

  UIState getValue(){
    return this.value;
  }

}