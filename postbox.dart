import 'postoffice.dart';

class PostBox {
  static const int _length = 5; //maximum storage 5 for each house number
  int _houseNum = 0; //storage key using house number
  Map<dynamic, Duration> _parcels = {};

  PostBox(int houseNum) {
    this._houseNum = houseNum;
  }

  PostBox.parcel(int houseNum, dynamic parcel, int days) {
    if (_parcels.isEmpty || _parcels.length < _length) {
      //check empty and with maximum 5
      _parcels[parcel] = Duration(days: days);
    }
  }

  //setter and getters
  void set HouseNum(int houseNum) {
    this._houseNum = houseNum;
  }

  void set ParcelList(Map<dynamic, Duration> parcellist) {
    this._parcels.addAll(parcellist);
  }

  int get HouseNum {
    return this._houseNum;
  }

  Map<dynamic, Duration> get ParcelList {
    return _parcels;
  }

  //check parcel storage is empty
  bool isEmpty() {
    if (_parcels.isEmpty) return true;
    return false;
  }

  void checkDuration() {
    _parcels.forEach((parcel, days) {
      if (days > Duration(days: 2)) returnParcel();
    });
  }

  void returnParcel() {}
}
