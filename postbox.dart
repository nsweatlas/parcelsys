import 'postoffice.dart';

class PostBox{
  static const int _length = 5;
  int _houseNum = 0; //storage key using house number
  List<dynamic> parcels = [_length]; //5 maximum storage // Map<int, dynamic> houseStorage = { 101:'parcel' };
  Duration _days = const Duration(days: 0);

  PostBox(){
  }

  PostBox.house(int houseNum){
    this._houseNum = houseNum;
  }
  
  //setter and getters
  void set HouseNum (int houseNum){
    this._houseNum = houseNum;
  }
  
  void set Days (Duration days){
    this._days = days;
  }

  int get HouseNum{
    return this._houseNum;
  }

  Duration get Days{
    return this._days;
  }

  isEmpty(){
    
  }

}