import 'dart:io';
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

  print("\nView parcels in storage");
  postOffice.displayParcel(postOffice.StorageList);
  print("\n1 - Back to menu\n"
      "2 - Add parcels to storage\n"
      "0 - Exit");
  pageInput("p1", postOffice);
}

// Add parcels
void page2(PostOffice postOffice) {
  print("\nAdd parcels, and duration of parcel in storage (in days)");
  //postOffice.addParcel();
  parcelListInput(postOffice);
  print("\n1 - Back to menu\n"
      "0 - Exit");
}

// View returned parcels
void page3(PostOffice postOffice) {
  print("\nView parcels in storage");
  postOffice.displayParcel(postOffice.ReturnedList);
  print("\n1 - Back to menu\n"
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
      stdout.write("\nEnter number: ");
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
      if (pgname == "main" || pgname == "p1") page2(postOffice); // Add parcels
      break;
    case 3:
      if (pgname == "main") page3(postOffice); // View returned parcels
      break;
  }
}

void parcelListInput(PostOffice postOffice) {
  //parcel Map name is confusing
  Map<dynamic, Duration> parcelList = {};

  dynamic _input;
  int _numInput;
  dynamic parcel;
  Duration days = Duration.zero;
  //dynamic _dayInput;
  bool isNull = true;
  bool isNum = false;

  do {
    try {
      stdout.write("Enter parcel code: ");
      _input = stdin.readLineSync();

      //not required, input error handling
      isNull = _input != null;
      parcel = _input;
    } catch (ex) {
      print("Invalid input: Input should not be null.");
    }

    try {
      stdout.write("\nEnter duration of parcel in storage, in days: ");
      _input = stdin.readLineSync();

      //not required, input error handling
      isNum = int.tryParse(_input) != null;
      _numInput = int.parse(_input);
      days = Duration(days: _numInput);
    } catch (ex) {
      print("Invalid input: Input is not a number.");
    }
  } while (!isNull && !isNum);

  print("Parcel code: $parcel, days: ${days.inDays}");
  parcelList.putIfAbsent(parcel, () => days);
  postOffice.addParcel(parcelList);
}
