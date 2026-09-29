#include <iostream>
#include <vector>

using namespace std;

void operation(void);

int main(void) {
    cout << "Welcome to IsaacCodesStuff's Calculator!\n";
    operation();
    return 0;
}

void operation(void) {
    bool repeat = true;
    do {
        cout << "========== IsaacCodesStuff's Calculator ==========\n";

        vector<string> operations {
            "Addition",
            "Subtraction",
            "Multiplication",
            "Division",
            "Exit"
        };

        for (int i = 0; i < 5; i++) {
            cout << i + 1 << ". " << operations[i] << '\n';
        }

        cout << "Choose operation from above: ";
        int choice;
        cin >> choice;

        if (choice < 1 || choice > 5) {
            cout << "Invalid operation.\n";
            return;
        }

        if (choice == 5) {
            cout << "Goodbye!\n";
            return;
        }

        cout << "Enter first number: ";
        int num1;
        cin >> num1;

        cout << "Enter second number: ";
        int num2;
        cin >> num2;

        double total;
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
                total = (double) num1 / num2;
                break;
            default:
                cout << "Goodbye!\n";
                repeat = false;
                break;
        }

        cout << "Result: " << total << '\n';

        char again;
        do {
            cout << "Do you wanna try again? ";
            cin >> again;

            if (again != 'y' && again != 'n') {
                cout << "You had TWO choices, and you chose something else?!\n";
            }
        } while (again != 'y' && again != 'n');
        repeat = again == 'y';

    } while (repeat);
    cout << "Goodbye!\n";
}