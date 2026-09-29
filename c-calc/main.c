#include <stdio.h>

void operation(void);

int main(void) {
    printf("Welcome to IsaacCodesStuff's Calculator!\n");
    operation();
    return 0;
}

void operation(void) {
    bool repeat = true;
    do {
        printf("========== IsaacCodesStuff's Calculator ==========\n");

        const char *operations[] = {
            "Addition",
            "Subtraction",
            "Multiplication",
            "Division",
            "Exit"
        };

        for (int i = 0; i < 5; i++) {
            printf("%d. %s\n", i + 1, operations[i]);
        }

        printf("Choose operation from above: ");
        int choice;
        scanf("%d", &choice);

        if (choice < 1 || choice > 5) {
            printf("Invalid operation.\n");
            return;
        }

        if (choice == 5) {
            printf("Goodbye!\n");
            return;
        }

        printf("Enter first number: ");
        int num1;
        scanf("%d", &num1);

        printf("Enter second number: ");
        int num2;
        scanf("%d", &num2);

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
                printf("Goodbye!\n");
                repeat = false;
                break;
        }

        printf("Result: %f\n", total);

        char again;
        do {
            printf("Do you wanna try again? ");
            scanf(" %c", &again);

            if (again != 'y' && again != 'n') {
                printf("You had TWO choices, and you chose something else?!\n");
            }
        } while (again != 'y' && again != 'n');
        repeat = again == 'y';

    } while (repeat);
    printf("Goodbye!\n");
}