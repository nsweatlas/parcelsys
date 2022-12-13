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

  List<PostBox> get StorageList {
    return this._parcelStorage;
  }

  List<PostBox> get ReturnedList {
    return this._parcelReturn;
  }

  void displayParcel(List<PostBox> boxlist) {
    print("House Number\t\tParcels\t\tDays");
    boxlist.forEach((index) {
      PostBox postbox = index;
      int hNum = postbox.HouseNum;
      int dayInt;
      Map<dynamic, Duration> plist = postbox.ParcelList;
      print("$hNum");
      plist.forEach((parcel, days) {
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
    // Alia
    if (pList.containsValue(Duration(days: 0)) ||
        pList.containsValue(Duration(days: 1))) {
      _parcelStorage.elementAt(houseNum - 1).ParcelList = pList;
    } else {
      _parcelReturn.elementAt(houseNum - 1).ParcelList = pList;
    }
  }
}
