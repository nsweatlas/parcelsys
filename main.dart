import 'dart:io';
import 'postoffice.dart';

void main() {
  num _input;

  print("\nPost Office Management System\n"
      "1 - View parcels in storage\n"
      "2 - Add parcels to storage\n"
      "0 - Exit");
  takeInput("main");
}

void page1() {
  num _input;

  PostOffice postOffice = PostOffice();
  // test: print(postOffice.parcelStorage.length);
  // List<PostBox> _parcelsystem = [];
  // _parcelsystem.length=_length;
  // List<PostBox> _parcelreturn = [];
  // _parcelsystem[0].parcels[1];

  print("\nView parcels in storage");
  postOffice.displayParcel();
  print("1 - Back to menu\n"
      "2 - Add parcels to storage\n"
      "0 - Exit");
  takeInput("p1");
}

void page2() {
  exit;
}

void takeInput(String pgname) {
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

  switch (_numinput) {
    case 0:
      exit;
      break;
    case 1:
      if (pgname == "main")
        page1();
      else if (pgname == "p1") main();
      break;
    case 2:
      if (pgname == "main" || pgname == "p1") page2();
      break;
  }
}
