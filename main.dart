import 'dart:io';
import 'postoffice.dart';

void main() {
  num _input;

  print("Post Office Management System\n"
      "1 - View parcels in storage\n"
      "2 - Add parcels to storage\n"
      "0 - Exit\n");

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
  postOffice.displayparcel();
  takeInput("p1");
}

void page1_add() {}

void page2() {
  exit;
}

void takeInput(String pgname) {
  dynamic _input;
  num _numinput = 0;
  bool isNum = false;
  do {
    try {
      stdout.write("Enter number: ");
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
      else if (pgname == "p1") page1_add();
      break;
    case 2:
      if (pgname == "main") page2();
      break;
  }
}
