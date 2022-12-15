import 'dart:io';
import 'postbox.dart';

class PostOffice {
  static const int _storelength = 30; //maximum storage 30
  List<int> _houseNum =
      List.generate(_storelength, (index) => index + 1, growable: false);
  // use late keyword to initialize at runtime instead of compile time
  late List<PostBox> _parcelStorage = List.generate(
      _storelength, (index) => PostBox(_houseNum.elementAt(index)),
      growable: false);
  late List<PostBox> _parcelReturn = List.generate(
      _storelength, (index) => PostBox(_houseNum.elementAt(index)),
      growable: false);

  // PostOffice() {} // redundant

  set StorageList(List<PostBox> list) {
    this._parcelStorage = list;
  }

  set ReturnedList(List<PostBox> list) {
    this._parcelReturn = list;
  }

  int get Length {
    return _storelength;
  }

  List<int> get HouseNumList {
    return this._houseNum;
  }

  List<PostBox> get StorageList {
    return this._parcelStorage;
  }

  List<PostBox> get ReturnedList {
    return this._parcelReturn;
  }

  void displayParcel(List<PostBox> boxList) {
    print("H.Num\t\tParcels\t\tDays");
    boxList.forEach((index) {
      PostBox postBox = index;
      int hNum = postBox.HouseNum;
      int dayInt;
      Map<dynamic, Duration> pList = postBox.ParcelList;
      print("$hNum");
      pList.forEach((parcel, days) {
        dayInt = days.inDays;
        print("\t"
            "$parcel"
            "\t\t"
            "$dayInt");
      });
    });
  }

  void addParcel(int houseNum, Map<dynamic, Duration> pList) {
    // if more than 2 days duration check/ parcel return to return storage
    PostBox postBox = _parcelStorage.elementAt(houseNum - 1);
    if (postBox.isEmpty() || postBox.ParcelList.length <= postBox.Length) {
      if (pList.containsValue(Duration(days: 0)) ||
          pList.containsValue(Duration(days: 1)) ||
          pList.containsValue(Duration(days: 2))) {
        _parcelStorage.elementAt(houseNum - 1).ParcelList = pList;
      } else {
        _parcelReturn.elementAt(houseNum - 1).ParcelList = pList;
      }
    } else
      print("Parcel storage for house number $_houseNum is full.");
  }
}
