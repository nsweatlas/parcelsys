import 'dart:io';
import 'postbox.dart';
import 'postoffice.dart';

void main() {
  num _input;
  PostOffice postOffice = PostOffice();

  print("\nPost Office Management System\n"
      "1 - View parcels in storage\n"
      "2 - Add parcels to storage\n"
      "3 - View returned parcels\n"
      "0 - Exit");
  pageInput("main", postOffice);
}

// 'Return' to copy of main menu
// Avoid missing link to previously created postOffice
void main_2(PostOffice postOffice) {
  print("\nPost Office Management System\n"
      "1 - View parcels in storage\n"
      "2 - Add parcels to storage\n"
      "3 - View returned parcels\n"
      "0 - Exit");
  pageInput("main", postOffice);
}

// View parcels in
void page1(PostOffice postOffice) {
  num _input;

  print("\n--------------------------------"
      "\nView parcels in storage");
  postOffice.displayParcel(postOffice.StorageList);
  print("\n1 - Back to menu\n"
      "2 - Add parcels to storage\n"
      "3 - View returned parcels\n"
      "0 - Exit");
  pageInput("p1", postOffice);
}

// Add parcels
void page2(PostOffice postOffice) {
  print("\n--------------------------------"
      "\nAdd parcels, and duration of parcel in storage (in days)");
  //postOffice.addParcel();
  parcelListInput(postOffice);
  print("\n1 - Back to menu\n"
      "2 - View parcels in storage\n"
      "3 - View returned parcels\n"
      "0 - Exit");
  pageInput("p2", postOffice);
}

// View returned parcels
void page3(PostOffice postOffice) {
  print("\n--------------------------------"
      "\nView parcels in storage");
  postOffice.displayParcel(postOffice.ReturnedList);
  print("\n1 - Back to menu\n"
      "2 - Add parcels to storage\n"
      "3 - View parcels in storage\n"
      "0 - Exit");
  pageInput("p3", postOffice);
  exit;
}

void pageInput(String pgname, PostOffice postOffice) {
  dynamic _input;
  num _numinput = 0;
  bool isNum = false;
  do {
    try {
      stdout.write("\nEnter page: ");
      _input = stdin.readLineSync();

      //not required, input error handling
      isNum = num.tryParse(_input) != null;
      _numinput = num.parse(_input);
    } catch (ex) {
      print("Input is not a number.");
    }
  } while (!isNum);

  // Navigation
  switch (_numinput) {
    case 0: //Exit
      exit;
      break;
    case 1:
      if (pgname == "main")
        page1(postOffice); // View parcels in storage
      else if (pgname == "p1" || pgname == "p2" || pgname == "p3")
        main_2(postOffice); // 'Return' to main menu
      break;
    case 2:
      if (pgname == "main" || pgname == "p1" || pgname == "p3")
        page2(postOffice); // Add parcels
      else if (pgname == "p2") page1(postOffice);
      break;
    case 3:
      if (pgname == "main" || pgname == "p1" || pgname == "p2")
        page3(postOffice); // View returned parcels
      break;
  }
}

void parcelListInput(PostOffice postOffice) {
  //parcel Map name is confusing
  Map<dynamic, Duration> parcelList = {};
  int _houseNum = 0;
  dynamic _input;
  int _numInput;
  dynamic parcel;
  Duration days = Duration.zero;
  //dynamic _dayInput;
  bool isNum = false;
  bool isFull = false;
  bool notValid = false;
  bool isNull = true;
  bool isYN = false;

  do {
    try {
      isFull = false;
      stdout.write("\nEnter house number: ");
      _input = stdin.readLineSync();

      //not required, input error handling
      isNum = int.tryParse(_input) != null;
      _houseNum = int.parse(_input);
      PostBox postBox = postOffice.StorageList.elementAt(_houseNum - 1);
      if ((_houseNum >= 1 && _houseNum <= postOffice.Length) &&
          (postBox.ParcelList.length >= postBox.Length)) {
        print("Parcel storage for house number $_houseNum is full.");
        isFull = true;
      } else if (_houseNum < 1 || _houseNum > postOffice.Length) {
        notValid = true;
        throw Exception();
      }
    } catch (ex) {
      if (_houseNum < 1 || _houseNum > postOffice.Length)
        print("Invalid input: Input must be 1 - 30.");
      else
        print("Invalid input: $_input is not a number.");
    }
  } while (!isNum || isFull || notValid);

  do {
    try {
      stdout.write("\nEnter parcel code: ");
      _input = stdin.readLineSync();

      //not required, input error handling
      isNull = _input.toString().isEmpty;
      if (!isNull)
        parcel = _input;
      else {
        print("Invalid input: Input should not be null.");
        throw Exception();
      }
    } catch (ex) {}
  } while (isNull);

  do {
    try {
      stdout.write("\nEnter duration of parcel in storage, in days: ");
      _input = stdin.readLineSync();
      isNum = false;
      //not required, input error handling
      isNum = int.tryParse(_input) != null;
      _numInput = int.parse(_input);
      days = Duration(days: _numInput);
    } catch (ex) {
      print("Invalid input: Input is not a number.");
    }
  } while (!isNum);

  print("House number: $_houseNum, code: $parcel, day(s): ${days.inDays}");
  parcelList.putIfAbsent(parcel, () => days);
  postOffice.addParcel(_houseNum, parcelList);

  do {
    try {
      stdout.write("\nAdd more parcels (Y/N)? ");
      _input = stdin.readLineSync();

      //not required, input error handling
      if (_input == 'y' || _input == 'Y' || _input == 'n' || _input == 'N') {
        isYN = true;
        if (_input == 'y' || _input == 'Y') parcelListInput(postOffice);
      } else {
        isYN = false;
        print("Invalid input: $_input is not 'Y' or 'N'.");
      }
    } catch (ex) {}
  } while (!isYN);
}
