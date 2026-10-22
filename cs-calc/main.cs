class Program {
    static void Main(string[] args) {
        Console.WriteLine("Welcome to IsaacCodesStuff's Calculator!");
        Operation();
    }

    static void Operation() {
        bool repeat = true;
        do {
            Console.WriteLine("========== IsaacCodesStuff's Calculator ==========");
            List<string> operationsList = [
                "Addition",
                "Subtraction",
                "Multiplication",
                "Division",
                "Exit",
            ];

            for (int i = 0; i < operationsList.Count; i++) {
                Console.WriteLine($"{i + 1}. {operationsList[i]}");
            }

            Console.Write("Choose operation from above: ");
            if (!int.TryParse(Console.ReadLine(), out int choice)) {
                Console.WriteLine("Invalid operation.");
                continue;
            }

            if (choice < 1 || choice > 5) {
                Console.WriteLine("Invalid operation.");
                continue;
            }
            if (choice == 5) {
                Console.WriteLine("Goodbye!");
                break;
            }

            Console.Write("Enter first number: ");
            if (!int.TryParse(Console.ReadLine(), out int num1)) {
                Console.WriteLine("Invalid number.");
                continue;
            }

            Console.Write("Enter second number: ");
            if (!int.TryParse(Console.ReadLine(), out int num2)) {
                Console.WriteLine("Invalid number.");
                continue;
            }

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
                    total = (double)num1 / num2;
                    break;
                default:
                    repeat = false;
                    break;
            }

            Console.WriteLine("Result: " + total);

            char again;
            do {
                Console.Write("Do you wanna try again? ");
                string? response = Console.ReadLine();
                again = string.IsNullOrEmpty(response)
                    ? '\0'
                    : char.ToLowerInvariant(response[0]);

                if (again != 'y' && again != 'n') {
                    Console.WriteLine("You had TWO choices, and you chose something else?!");
                }
            } while (again != 'y' && again != 'n');
            repeat = again == 'y';

        } while (repeat);
        Console.WriteLine("Goodbye!");
    }
}