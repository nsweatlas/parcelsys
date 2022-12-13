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

  void displayParcel(List<PostBox> plist) {
    print("House Number\t\tParcels\t\tDays");
    plist.forEach((index) {
      PostBox postbox = index;
      int hNum = postbox.HouseNum;
      Map<dynamic, Duration> plist = postbox.ParcelList;
      print("$hNum\t\t");
      plist.forEach((parcel, days) {
        print("$parcel"
            "\t\t"
            "$days");
      });
    });
  }

  void addParcel(Map<dynamic, Duration> pList) {}
}
