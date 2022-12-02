import 'postbox.dart';

class PostOffice{
  static const int _length = 30;
  List<int> _houseNum = List.filled(_length, 0);
  // deprecated: houseNum = new List(_length) // [_length]
  List<PostBox>_parcelStorage = List.generate(_length, (i)=>PostBox.house((i)), growable: false);
  // List<PostBox> _returnParcel = [];
  // _returnParcel.length=_length;

  checkParcel(){
    _parcelStorage.forEach((postBox) {
      if(postBox.Days>Duration(days: 2))
        returnParcel();
    });
  }
  
  returnParcel(){
  }


}