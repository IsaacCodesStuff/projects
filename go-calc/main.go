package main

import "fmt"

func main() {
	fmt.Println("Welcome to IsaacCodesStuff's Calculator!")
	operation()
}

func operation() {
	repeat := true
	for repeat {
		fmt.Println("========== IsaacCodesStuff's Calculator ==========")

		operations := []string{
			"Addition",
			"Subtraction",
			"Multiplication",
			"Division",
			"Exit",
		}

		for i := 0; i < 5; i++ {
			fmt.Printf("%d. %s\n", i + 1, operations[i])
		}

		fmt.Println("Choose operation from above: ")
		var choice int
		fmt.Scan(&choice)

		if choice < 1 || choice > 5 {
			fmt.Println("Invalid operation.")
			return
		}

		if choice == 5 {
			fmt.Println("Goodbye!")
			return
		}

		fmt.Println("Enter first number: ")
		var num1 int
		fmt.Scan(&num1)
		fmt.Println("Enter second number: ")
		var num2 int
		fmt.Scan(&num2)

		var total int
		switch choice {
		case 1:
			total = num1 + num2
		case 2:
			total = num1 - num2
		case 3:
			total = num1 * num2
		case 4:
			total = num1 / num2
		}

		fmt.Printf("Result: %d\n", total)

		for {
			fmt.Println("Do you wanna try again? ")

			var again string
			fmt.Scan(&again)

			if again == "y" || again == "n" {
				repeat = again == "y"
				break
			}

			fmt.Println("You had TWO choices, and you chose something else?!")
		}
	}
	fmt.Println("Goodbye!")
}