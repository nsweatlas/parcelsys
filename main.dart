import 'dart:io';
import '../fluttercodes/parceltest.dart';
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

  print("View parcels in storage");
  takeInput("p1");
}

void page2() {
  exit;
}

void takeInput(String pagename) {
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
  if (_numinput == 0) exit;
  if (_numinput == 1) {
    if (pagename == "main") page1();
    if (pagename == "p1") page1();
  }
  if (_numinput == 2) {
    if (pagename == "main") page2();
  }
}
