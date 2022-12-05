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
  takeInput("main", postOffice);
}

void page1(PostOffice postOffice) {
  num _input;

  print("\nView parcels in storage");
  postOffice.displayParcel();
  print("1 - Back to menu\n"
      "2 - Add parcels to storage\n"
      "0 - Exit");
  takeInput("p1", postOffice);
}

void page2(PostOffice postOffice) {
  exit;
}

void page3(PostOffice postOffice) {
  exit;
}

void takeInput(String pgname, PostOffice postOffice) {
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
        page1(postOffice);
      else if (pgname == "p1") main();
      break;
    case 2:
      if (pgname == "main" || pgname == "p1") page2(postOffice);
      break;
  }
}
