import 'postbox.dart';

class PostOffice {
  static const int _length = 30; //maximum storage 30
  List<int> _houseNum = [];
  //= List.filled(_length, 0);
  // deprecated: houseNum = new List(_length) // [_length]
  // generate list of 30 postboxes to store and return (over 2 days)
  List<PostBox> _parcelStorage = [];
  // List.generate(_length, (houseNum) => PostBox((houseNum)),growable: true);
  List<PostBox> _parcelReturn =
      List.generate(_length, (houseNum) => PostBox((houseNum)), growable: true);

  PostOffice() {}
}
