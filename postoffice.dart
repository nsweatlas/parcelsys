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

  PostOffice() {}

  void displayParcel() {
    print("House Number\t\tParcels\tDays");
    // _houseNum.forEach(print);
    _parcelStorage.forEach((index) {
      PostBox postbox = index;
      int hNum = postbox.HouseNum;
      Map<dynamic, Duration> plist = postbox.ParcelList;
      print("$hNum\t\t");
      plist.forEach((key, value) {
        print("$key\t$value");
      });
    });
  }

  void addParcel() {}
}
