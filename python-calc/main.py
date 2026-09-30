print("Welcome to IsaacCodesStuff's Calculator!")

repeat = True

while repeat:
    print("========== IsaacCodesStuff's Calculator ==========")

    operations = [
        "Addition",
        "Subtraction",
        "Multiplication",
        "Division",
        "Exit"
    ]

    for i, operation in enumerate(operations, start=1):
        print(f"{i}. {operation}")

    choice = int(input("Choose operation from above: "))

    if choice < 1 or choice > 5:
        print("Invalid operation.")
        continue

    if choice == 5:
        break

    num1 = int(input("Enter first number: "))
    num2 = int(input("Enter second number: "))

    if choice == 1:
        total = num1 + num2
    elif choice == 2:
        total = num1 - num2
    elif choice == 3:
        total = num1 * num2
    elif choice == 4:
        total = num1 / num2

    print(f"Result: {total}")

    while True:
        again = input("Do you wanna try again? ")

        if again == 'y' or again == 'n':
            repeat = again == 'y'
            break

        print("You had TWO choices, and you chose something else?!")

print("Goodbye!")