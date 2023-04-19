import 'dart:ffi';

import 'package:flutter/foundation.dart';
import '../data_and _model.dart/data.dart';
import '../data_and _model.dart/data_model.dart';

List<DataModel> liked = [];

class CountandSlashProvider extends ChangeNotifier {
  int _index = 0;
  int get value => _index;
  int count() {
    return liked.length;
  }

  void setValue(int val) {
    _index = val;
    dummyData[_index].isSelected = !dummyData[_index].isSelected;
    liked.add(dummyData[_index]);
    notifyListeners();
  }

  void delete(int val) {
    _index = val;
    dummyData[_index].isSelected = !dummyData[_index].isSelected;
    liked.remove(dummyData[_index]);
    notifyListeners();
  }
}
