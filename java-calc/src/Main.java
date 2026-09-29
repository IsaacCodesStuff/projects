import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        System.out.println("Welcome to IsaacCodesStuff's Calculator!");
        operation();
    }

    public static void operation() {
        Scanner scanner = new Scanner(System.in);
        boolean repeat = true;
        do {
            System.out.println("========== IsaacCodesStuff's Calculator ==========");
            List<String> operationsList = new ArrayList<>();
            operationsList.add("Addition");
            operationsList.add("Subtraction");
            operationsList.add("Multiplication");
            operationsList.add("Division");
            operationsList.add("Exit");

            for (int i = 0; i < operationsList.size(); i++) {
                System.out.println((i + 1) + ". " + operationsList.get(i));
            }

            System.out.print("Choose operation from above: ");
            int choice = scanner.nextInt();

            if (choice < 1 || choice > 5) {
                System.out.println("Invalid operation.");
                continue;
            }
            if (choice == 5) {
                System.out.print("Goodbye!");
                break;
            }

            System.out.print("Enter first number: ");
            int num1 = scanner.nextInt();
            System.out.print("Enter second number: ");
            int num2 = scanner.nextInt();

            double total = 0;
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
                    System.out.println("Goodbye!");
                    repeat = false;
                    break;
            }

            System.out.println("Result: " + total);

            char again;
            do {
                System.out.print("Do you wanna try again? ");
                again = Character.toLowerCase(scanner.next().charAt(0));

                if (again != 'y' && again != 'n') {
                    System.out.println("You had TWO choices, and you chose something else?!");
                }
            } while (again != 'y' && again != 'n');
            repeat = again == 'y';

        } while (repeat);
        System.out.print("Goodbye!");
        scanner.close();
    }
}
