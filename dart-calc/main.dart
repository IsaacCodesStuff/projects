import 'dart:io';

void main() {
  print("Welcome to IsaacCodesStuff's Calculator!");
  operation();
}

void operation() {
  bool repeat = true;
  do {
    print("========== IsaacCodesStuff's Calculator ==========");

    List<String> operations = [
      "Addition",
      "Subtraction",
      "Multiplication",
      "Division",
      "Exit"
    ];

    for (int i = 0; i < operations.length; i++) {
      print("${i + 1}. ${operations[i]}");
    }

    print("Choose operation from above: ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice < 1 || choice > 5) {
        print("Invalid operation.\n");
        return;
    }

    if (choice == 5) {
        print("Goodbye!\n");
        return;
    }

    print("Enter first number: ");
    int num1 = int.parse(stdin.readLineSync()!);

    print("Enter second number: ");
    int num2 = int.parse(stdin.readLineSync()!);

    num total;
    switch (choice) {
        case 1:
            total = num1 + num2;
            break;
        case 2:
            total = num1 - num2;
            break;
        case 3:
            total = num1 * num2;
            break;
        case 4:
            total = num1 / num2;
            break;
        default:
            print("Goodbye!\n");
            repeat = false;
            continue;
    }

    print("Result: $total");

    String again;
    do {
        print("Do you wanna try again? ");
        again = stdin.readLineSync()![0];

        if (again != 'y' && again != 'n') {
            print("You had TWO choices, and you chose something else?!\n");
        }
    } while (again != 'y' && again != 'n');
    repeat = again == 'y';
  
  } while (repeat);
  print("Goodbye!\n");
}