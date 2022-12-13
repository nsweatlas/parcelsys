import 'postoffice.dart';

class PostBox {
  static const int _length = 5; //maximum storage 5 for each house number
  int _houseNum = 0; //storage key using house number
  Map<dynamic, Duration> _parcelList = {};

  PostBox(int houseNum) {
    this._houseNum = houseNum;
  }

  PostBox.parcel(int houseNum, dynamic parcel, int days) {
    if (_parcelList.isEmpty || _parcelList.length < _length) {
      //check empty and with maximum 5
      _parcelList[parcel] = Duration(days: days);
    }
  }

  //setter and getters
  void set HouseNum(int houseNum) {
    this._houseNum = houseNum;
  }

  void set ParcelList(Map<dynamic, Duration> parcellist) {
    this._parcelList.addAll(parcellist);
  }

  int get HouseNum {
    return this._houseNum;
  }

  Map<dynamic, Duration> get ParcelList {
    return _parcelList;
  }

  //check parcel storage is empty
  bool isEmpty() {
    if (_parcelList.isEmpty) return true;
    return false;
  }
}
